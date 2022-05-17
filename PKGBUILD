# Maintainer: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
pkgver=r2403.3045e860
pkgrel=1
pkgdesc="Configuration utility for RGB lights supporting motherboards, RAM, & peripherals"
arch=('x86_64')
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL2')
depends=('qt5-base' 'libusb' 'hidapi' 'mbedtls')
makedepends=('git')
optdepends=('i2c-tools: Motherboard & RAM access')
provides=('openrgb')
conflicts=('openrgb')
source=("openrgb::git+https://gitlab.com/CalcProgrammer1/openrgb.git"
        'openrgb.conf')
sha256sums=('SKIP'
            'b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2')

pkgver() {
    cd openrgb
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/openrgb"
    qmake OpenRGB.pro
    make
    "."/scripts/build-udev-rules.sh "."
}

package() {
    cd "$srcdir/openrgb"
    install -Dm755 -t "$pkgdir"/usr/bin openrgb
    install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/128x128 "."/qt/OpenRGB.png
    install -Dm644 -t "$pkgdir"/usr/share/applications "."/qt/OpenRGB.desktop
    install -Dm644 -t "$pkgdir"/usr/lib/udev/rules.d 60-openrgb.rules
    install -Dm644 -t "$pkgdir"/usr/lib/modules-load.d ".."/openrgb.conf
}
