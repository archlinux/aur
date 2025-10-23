# Maintainer: Alastair Ozmond <alastair.ozmond@gmail.com>
pkgname=usb-tree-app
pkgver=0.0.1
pkgrel=1
pkgdesc="USB device tree viewer with detailed information"
arch=('x86_64')
url="https://github.com/AOzmond/usb-tree"
license=('GPL-2.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'libusb')
makedepends=('go' 'bun-bin' 'git')
provides=('usb-tree')
conflicts=('usb-tree' 'usb-tree-app-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0cea900bb4c7ce78e57bf88fc5f7cc9bc30449af2bc36bb3a1feec16d6a858a9')

build() {
    cd "${srcdir}/usb-tree-${pkgver}"

    # Install frontend dependencies
    cd app/frontend
    bun install

    # Build the application with wails
    cd ../
    go install github.com/wailsapp/wails/v2/cmd/wails@latest
    ~/go/bin/wails build -clean -platform linux/amd64
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
