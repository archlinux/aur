# Maintainer: Alastair Ozmond <alastair.ozmond@gmail.com>
pkgname=usb-tree-app
pkgver=0.0.5
pkgrel=1
pkgdesc="USB device tree viewer with detailed information and monitor"
arch=('any')
url="https://github.com/AOzmond/usb-tree"
license=('GPL-2.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'libusb')
makedepends=('go' 'bun-bin' 'git')
provides=('usb-tree')
conflicts=('usb-tree' 'usb-tree-app-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e8f3c14a71635398a79cb233bdcba7f5a23a6001774e74fa1fcf4b0e9084a3c2')

build() {
    cd "${srcdir}/usb-tree-${pkgver}"

    # Install frontend dependencies
    cd app/frontend
    bun install

    # Build the application with wails
    cd ../
    go install github.com/wailsapp/wails/v2/cmd/wails@latest
    $(go env GOPATH)/bin/wails build -clean
}

package() {
    cd "${srcdir}/usb-tree-${pkgver}"

    # Install binary
    install -Dm755 "app/build/bin/usb-tree" "${pkgdir}/usr/bin/usb-tree"

    # Install desktop file
    install -Dm644 "app/build/linux/usb-tree.desktop" "${pkgdir}/usr/share/applications/usb-tree.desktop"

    # Install icon
    install -Dm644 "app/build/linux/usb-tree.png" "${pkgdir}/usr/share/pixmaps/usb-tree.png"

    # Also install icon in hicolor theme (standard location)
    install -Dm644 "app/build/linux/usb-tree.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/usb-tree.png"

    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
