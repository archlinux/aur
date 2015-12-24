# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=visual-studio-code-oss
pkgdesc='Visual Studio Code for Linux, Open Source version'
pkgver=0.10.6
pkgrel=1
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('MIT')
makedepends=('npm' 'gulp' 'python2')
depends=('gtk2' 'gconf')
conflicts=('vscode-oss')
provides=('vscode-oss')

source=("https://github.com/Microsoft/vscode/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha1sums=('4b979c5da74a450972cbefb31a0a166891d6d4d7'
          '9ba4659068dc5a71b2bb30eb106872e525660e3f')

case "$CARCH" in
    i686)
        _vscode_arch=ia32
        ;;
    x86_64)
        _vscode_arch=x64
        ;;
    *)
        # Needed for mksrcinfo
        _vscode_arch=DUMMY
        ;;
esac

build() {
    cd "${srcdir}/vscode-${pkgver}"

    ./scripts/npm.sh install
    gulp vscode-linux-${_vscode_arch}
}

package() {
    install -m 0755 -d "${pkgdir}/opt/VSCode-OSS"
    cp -r "${srcdir}/VSCode-linux-${_vscode_arch}"/* "${pkgdir}/opt/VSCode-OSS"

    # Include symlink in system bin directory
    install -m 0755 -d "${pkgdir}/usr/bin"
    ln -s '/opt/VSCode-OSS/Code [OSS Build]' "${pkgdir}/usr/bin/${pkgname}"

    # Add .desktop file
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install license file
    install -D -m644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
