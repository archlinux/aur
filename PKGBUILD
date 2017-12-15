# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>

# Set this to 1 if you want to enable the proprietary Visual Studio Code
# features.  Leaving this at 0 will cause the extension manager to work in
# a local-only mode (you'll have to download and install extensions manually).
[[ -z "$VSCODE_NONFREE" ]] && VSCODE_NONFREE=0

pkgname=visual-studio-code-oss
pkgdesc='Visual Studio Code for Linux, Open Source version'
pkgver=1.19.0
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='https://code.visualstudio.com/'
license=('MIT')
makedepends=('npm' 'nodejs>=6.8.0' 'gulp' 'python2' 'git' 'yarn')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'libxtst' 'libxkbfile' 'nss'
         'alsa-lib')
conflicts=('vscode-oss')
provides=('vscode-oss')

source=("vscode::git+https://github.com/Microsoft/vscode#tag=${pkgver}"
        "startup_script.patch"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            '8b2feded3382e5bf6b5b292c14083bfc536c05cd00f3235dd22b75b67fba134d'
            'd140d0de9998a2a886a6d2ff23f356f8b68c8aae5a53c33ec87826e5d7ad3529')

if (( VSCODE_NONFREE )); then
    source+=('product_json.patch')
    sha256sums+=('e90f9d69bd42c0d9fc5f081d3bf7ca307df53e3553efadf00d62ced66b1bb070')
    install="${pkgname}.nonfree.install"
    license+=('proprietary')
fi

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

prepare() {
    cd "${srcdir}/vscode"

    if (( VSCODE_NONFREE )); then
        patch -p1 -i "${srcdir}/product_json.patch"
        local _commit=$(cd "${srcdir}/vscode" && git rev-parse HEAD)
        local _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
        sed -e "s/@COMMIT@/${_commit}/" -e "s/@DATE@/${_datestamp}/" \
            -i product.json
    fi
}

build() {
    cd "${srcdir}/vscode"

    yarn install --arch=${_vscode_arch}

    # The default memory limit may be too low for current versions of node
    # to successfully build vscode.  Uncomment this to set it to 2GB, or
    # change it if this number still doesn't work for your system.
    mem_limit="--max_old_space_size=2048"
    /usr/bin/node $mem_limit /usr/bin/gulp vscode-linux-${_vscode_arch}

    # Patch the startup script to know where the app is installed, rather
    # than guessing...
    ( cd "${srcdir}/VSCode-linux-${_vscode_arch}" && \
            patch -p1 -i "${srcdir}/startup_script.patch" )
}

package() {
    install -m 0755 -d "${pkgdir}/usr/share/code-oss"
    cp -r "${srcdir}/VSCode-linux-${_vscode_arch}"/* "${pkgdir}/usr/share/code-oss"

    # Put the startup script in /usr/bin
    mv "${pkgdir}/usr/share/code-oss/bin" "${pkgdir}/usr"

    # Add symlink to the name we provided in older versions of this package
    ln -s code-oss "${pkgdir}/usr/bin/${pkgname}"

    # Add .desktop file
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install license file
    install -D -m644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
