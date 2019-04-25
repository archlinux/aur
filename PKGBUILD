# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=code-git
pkgdesc='The Open Source build of Visual Studio Code (vscode) editor - git latest'
pkgver=1.16.0.r25714.g2328356959
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/Microsoft/vscode'
license=('MIT')
depends=('electron' 'libsecret' 'libxkbfile' 'ripgrep')
makedepends=('npm' 'gulp' 'python2' 'git' 'yarn' 'nodejs-lts-dubnium')
conflicts=('visual-studio-code-git')
provides=('visual-studio-code-git')

source=("git+https://github.com/Microsoft/vscode"
        "${pkgname}.js"
        "${pkgname}.sh"
        "product_json.diff"
        "code-liveshare.diff")
sha512sums=('SKIP'
            '889ca4d4b810b4a67319cece0e1bfeae61b33905adef64f9b27152e43e112dc53a94b1875fe0a810f0d0192dec0107aed2d01c12d6a17427db4261858f96a02a'
            '5d1cf747d365da2e12250079ba986ad5a7e70a7966900ee77a557b5989978cb24a6a8682342e87f19ffe3666d7a91bfd9004b1fc0c1da08d2ba9241e7a808ff5'
            '8ec47e497287d67f37e7b669af416f43d5cdbd4574892867d7b95996ef5de53640b5bc919b06b177e1fd91cb005579d6ed0c17325117b9914ba7cf28f5f06e40'
            '0bd10ca06dea22854e47fc45d833756ee8d7bf714c88f63feef44e0b0b5da052fba3c27d001865e3389f391cd7b888d92dc0ba44029fa5c736225da3cf2f9a46')

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

pkgver() {
    cd "${srcdir}/vscode"
    git describe --tags --match '?.*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/vscode"

    # This patch no longer contains proprietary modifications.
    # See https://github.com/Microsoft/vscode/issues/31168 for details.
    patch -p0 -i "${srcdir}/product_json.diff"
    local _commit=$(cd "${srcdir}/vscode" && git rev-parse HEAD)
    local _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
    sed -e "s/@COMMIT@/${_commit}/" -e "s/@DATE@/${_datestamp}/" \
        -i product.json

    # See https://github.com/MicrosoftDocs/live-share/issues/262 for details
    patch -p1 -i "${srcdir}/code-liveshare.diff"

    # Build native modules for system electron
    local _target=$(</usr/lib/electron/version)
    sed -i "s/^target .*/target \"${_target//v/}\"/" .yarnrc

    # Patch appdata and desktop file
    sed -i 's|/usr/share/@@NAME@@/@@NAME@@|@@NAME@@|g
            s|@@NAME_SHORT@@|Code - Git|g
            s|@@NAME_LONG@@|Code - Git|g
            s|@@NAME@@|code-git|g
            s|@@ICON@@|code-git|g
            s|@@LICENSE@@|MIT|g
            s|inode/directory;||' resources/linux/code.{appdata.xml,desktop}

    # Fix bin path
    sed -i "s|return path.join(path.dirname(execPath), 'bin', \`\${product.applicationName}\`);|return '/usr/bin/${pkgname}';|g
            s|return path.join(appRoot, 'scripts', 'code-cli.sh');|return '/usr/bin/${pkgname}';|g" \
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
    # to successfully build vscode.  Uncomment this to set it to 2GB, or
    # change it if this number still doesn't work for your system.
    mem_limit="--max_old_space_size=4096"

    if ! /usr/bin/node $mem_limit /usr/bin/gulp vscode-linux-${_vscode_arch}-min
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

    # Replace statically included binary with system version
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
    install -Dm 644 VSCode-linux-${_vscode_arch}/resources/app/resources/linux/code.png \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Install license files
    install -Dm 644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/ThirdPartyNotices.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}
