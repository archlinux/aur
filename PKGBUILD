# Maintainer: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
pkgver=r1230.ef0a4c3
pkgrel=1
pkgdesc="Configuration utility for RGB lights supporting motherboards, RAM, & peripherals"
arch=('x86_64')
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL2')
depends=('qt5-base' 'libusb' 'hidapi')
makedepends=('git' 'make' 'binutils' 'pkgconf')
optdepends=('i2c-tools: Motherboard & RAM access')
conflicts=('openrgb')
provides=('openrgb')
source=("openrgb::git+https://gitlab.com/CalcProgrammer1/openrgb.git"
        'openrgb.desktop'
        'openrgb.conf')
sha256sums=('SKIP'
            '2e8d24575773b17d86d8ad01789a40be2ecaa7840e51e346b851b3910d45ae1b'
            'b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2')

pkgver() {
    cd openrgb
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/openrgb"
    qmake OpenRGB.pro
    make -j$(($(nproc)+1))
}

package() {
    cd "$srcdir/openrgb"
    install -Dm755 openrgb "$pkgdir"/usr/bin/openrgb
    install -Dm644 qt/OpenRGB.png "$pkgdir"/usr/share/pixmaps/openrgb.png
    install -Dm644 -t "$pkgdir"/usr/share/applications ../openrgb.desktop
    install -Dm644 -t "$pkgdir"/usr/lib/udev/rules.d 60-openrgb.rules
    install -Dm644 -t "$pkgdir"/usr/lib/modules-load.d ../openrgb.conf
}
