# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=code-git
pkgdesc='The Open Source build of Visual Studio Code (vscode) editor - git latest'
pkgver=1.16.0.r22053.g4fe1cdc4df
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/Microsoft/vscode'
license=('MIT')
depends=('electron' 'libsecret' 'libxkbfile')
makedepends=('npm' 'gulp' 'python' 'python2' 'git' 'yarn' 'nodejs-lts-carbon')
conflicts=('visual-studio-code-git')
provides=('visual-studio-code-git')

source=("git+https://github.com/Microsoft/vscode"
        "${pkgname}.js"
        "${pkgname}.sh"
        "code-liveshare.patch"
        "product_json.patch")
sha256sums=('SKIP'
            '64aca444a714dd67da6d5b71ab8d0255e767cb265918d556b3bf8194fca0a7ef'
            'df452e6f64f62081aa4a8da69a071b2c122095eea48dca409a7a851243b9ff36'
            'ab3b08aac7e311d9bf5a0985067f2875bb3a1a0802bfa736489941887a0f05ba'
            '69d5c743fad5466583eba81411792ef5f3cbb6d721de1ebd584ea4a5e2079065')

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
    patch -p1 -i "${srcdir}/product_json.patch"
    local _commit=$(cd "${srcdir}/vscode" && git rev-parse HEAD)
    local _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
    sed -e "s/@COMMIT@/${_commit}/" -e "s/@DATE@/${_datestamp}/" \
        -i product.json

    # See https://github.com/MicrosoftDocs/live-share/issues/262 for details
    patch -p1 -i "${srcdir}/code-liveshare.patch"

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
}

build() {
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
