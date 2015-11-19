# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=vscode
pkgdesc='Visual Studio Code for Linux'
pkgver=0.10.1
pkgrel=1
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('custom')
makedepends=('npm' 'gulp')
depends=('gtk2' 'gconf')
conflicts=('vscode-bin')

source=("https://github.com/Microsoft/vscode/archive/${pkgver}.tar.gz"
        vscode.desktop)
sha1sums=('4c9a4f2033c55bc2d8fd3efcfcb056fc446f235b'
          '33cdc2df8d89d544f994f914c3bb3b414e3b81b7')

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
    cd "${srcdir}/${pkgname}-${pkgver}"

    npm install
    gulp vscode-linux-${_vscode_arch}
}

package() {
    install -m 0755 -d "${pkgdir}/opt/VSCode"
    cp -r "${srcdir}/VSCode-linux-${_vscode_arch}"/* "${pkgdir}/opt/VSCode"

    # Include symlink in system bin directory
    install -m 0755 -d "${pkgdir}/usr/bin"
    ln -s '/opt/VSCode/Code [OSS Build]' "${pkgdir}/usr/bin/vscode"

    # Add .desktop file
    install -D -m644 "${srcdir}/vscode.desktop" \
            "${pkgdir}/usr/share/applications/vscode.desktop"

    # Install license file
    install -D -m644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
