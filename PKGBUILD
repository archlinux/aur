# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=code-git
pkgdesc='The Open Source build of Visual Studio Code (vscode) editor - git latest'
_electron=electron
pkgver=1.58.0.r84354.g67ff594cca4
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/microsoft/vscode'
license=('MIT')
depends=("$_electron" 'libsecret' 'libx11' 'libxkbfile' 'ripgrep')
optdepends=('bash-completion: Bash completions'
            'zsh-completions: ZSH completitons'
            'x11-ssh-askpass: SSH authentication')
makedepends=('git' 'gulp' 'npm' 'python2' 'yarn' 'nodejs-lts-fermium')
conflicts=('visual-studio-code-git')
provides=('visual-studio-code-git')

source=("git+https://github.com/Microsoft/vscode"
        "${pkgname}.js"
        "${pkgname}.sh"
        "product_json.diff"
        "code-liveshare.diff")
sha512sums=('SKIP'
            'a97cbc79d76d2dad2ced74d66fa57b9a0aa3d82767d420b520bbaaf007c03ac60d61134668895ab4a8bd38951974c42afc59c03105ccc892742b34fee9b2c509'
            '9bd93ec7ba946c005d3a12ea71ae2903593d17d3e4dcf55b4a5b612ebc82237338f0aaec59613eb77f355b0116aeb31320d0d32cd993233f140479ced44dfdbf'
            'b1aa0d7c5b3e3e8ba1172822d75ea38e90efc431b270e0b4ca9e45bf9c0be0f60922c8618969ef071b5b6dbd9ac9f030294f1bf49bcc28c187b46d113dca63a7'
            'a9f2f3e07f8ffe9def036cb2aa6d587444ea1cf9d9e1b29637b3d86ccf98e3ee2c50d219405155449c06654f753a296a820b11bdab48928baf25043217f149a0')

case "$CARCH" in
    i686)
        _vscode_arch=ia32
        ;;
    x86_64)
        _vscode_arch=x64
        ;;
    armv7h)
        _vscode_arch=arm
        ;;
    *)
        # Needed for mksrcinfo
        _vscode_arch=DUMMY
        ;;
esac

if [ -z "$mem_limit" ]; then
    mem_limit=6144
fi

pkgver() {
    cd "${srcdir}/vscode"
    # People love to complain, so here's a complex version that still
    # increases monotonically by commit but also has the package.json
    # version instead of the most recent tag...
    printf "%s.r%s.g%s" \
        "$(awk 'match($0,/"version":\s*"([^"]+)"/,v) {print v[1]}' package.json)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/vscode"

    # Change electron binary name to the target electron
    sed -i "s|exec electron |exec $_electron |" ../code-git.sh
    sed -i "s|#!/usr/bin/electron|#!/usr/bin/$_electron|" ../code-git.js

    # This patch no longer contains proprietary modifications.
    # See https://github.com/Microsoft/vscode/issues/31168 for details.
    patch -p0 -i "${srcdir}/product_json.diff"

    # Set the commit and build date
    local _commit=$(git rev-parse HEAD)
    local _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
    sed -e "s/@COMMIT@/${_commit}/" -e "s/@DATE@/${_datestamp}/" \
        -i product.json

    # See https://github.com/MicrosoftDocs/live-share/issues/262 for details
    # Also, https://github.com/microsoft/vscode/issues/48946
    patch -p1 -i "${srcdir}/code-liveshare.diff"

    # Build native modules for system electron
    local _target=$(</usr/lib/$_electron/version)
    sed -i "s/^target .*/target \"${_target//v/}\"/" .yarnrc

    # Patch appdata and desktop file
    sed -i 's|/usr/share/@@NAME@@/@@NAME@@|@@NAME@@|g
            s|@@NAME_SHORT@@|Code - Git|g
            s|@@NAME_LONG@@|Code - Git|g
            s|@@NAME@@|code-git|g
            s|@@ICON@@|code-git|g
            s|@@EXEC@@|/usr/bin/code-git|g
            s|@@LICENSE@@|MIT|g
            s|@@URLPROTOCOL@@|vscode|g
            s|inode/directory;||' resources/linux/code{.appdata.xml,.desktop,-url-handler.desktop}

    sed -i 's|MimeType=.*|MimeType=x-scheme-handler/code-git;|' resources/linux/code-url-handler.desktop

    # Patch completitions with correct names
    sed -i 's|@@APPNAME@@|code-git|g' resources/completions/{bash/code,zsh/_code}

    # Fix bin path
    sed -i "s|return path.join(path.dirname(execPath), 'bin', \`\${product.applicationName}\`);|return '/usr/bin/code-git';|g
            s|return path.join(appRoot, 'scripts', 'code-cli.sh');|return '/usr/bin/code-git';|g" \
        src/vs/platform/environment/node/environmentService.ts
}

build() {
    # https://github.com/mapbox/node-sqlite3/issues/1044
    mkdir -p path
    ln -sf /usr/bin/python2 path/python
    export PATH="$PWD/path:$PATH"

    cd "${srcdir}/vscode"

    yarn install --arch=${_vscode_arch}

    # The default memory limit may be too low for current versions of node
    # to successfully build vscode.  Set mem_limit=<value> on the makepkg
    # command line if the default still doesn't work for your system.
    _mem_limit="--max_old_space_size=$mem_limit"

    if ! /usr/bin/node $_mem_limit /usr/bin/gulp vscode-linux-${_vscode_arch}-min
    then
        echo
        echo "*** NOTE: If the build failed due to running out of file handles (EMFILE),"
        echo "*** you will need to raise your max open file limit."
        echo "*** You can check this for more information on how to increase this limit:"
        echo "***    https://ro-che.info/articles/2017-03-26-increase-open-files-limit"
        exit 1
    fi
}

package() {
    install -dm 755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r --no-preserve=ownership --preserve=mode \
        VSCode-linux-${_vscode_arch}/resources/app/* \
        "${pkgdir}/usr/lib/${pkgname}"

    # Replace statically included binary with system copy
    ln -sf /usr/bin/rg \
            "${pkgdir}/usr/lib/${pkgname}/node_modules.asar.unpacked/vscode-ripgrep/bin/rg"

    # Put the startup script in /usr/bin
    install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 755 ${pkgname}.js "${pkgdir}/usr/lib/${pkgname}/${pkgname}.js"

    # Install appdata and desktop file
    install -Dm 644 vscode/resources/linux/code.appdata.xml \
            "${pkgdir}/usr/share/metainfo/${pkgname}.appdata.xml"
    install -Dm 644 vscode/resources/linux/code.desktop \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 644 vscode/resources/linux/code-url-handler.desktop \
            "${pkgdir}/usr/share/applications/${pkgname}-url-handler.desktop"
    install -Dm 644 VSCode-linux-${_vscode_arch}/resources/app/resources/linux/code.png \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Install bash and zsh completions
    install -Dm 644 vscode/resources/completions/bash/code \
            "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm 644 vscode/resources/completions/zsh/_code \
            "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

    # Install license files
    install -Dm 644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/ThirdPartyNotices.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}
