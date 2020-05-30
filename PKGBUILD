# Maintainer: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
pkgver=r570.1d426f1
pkgrel=1
pkgdesc='Configuration utility for RGB lights supporting motherboards, RAM, & peripherals'
arch=('x86_64')
url='https://gitlab.com/CalcProgrammer1/OpenRGB'
license=('GPL2')
depends=('qt5-base' 'libusb' 'hidapi')
optdepends=('i2c-piix4-aura-dkms: AMD motherboard support standalone'
            'linux-openrgb: Patched kernel for AMD & intel')
makedepends=('git' 'make')
conflicts=('openrgb')
provides=('openrgb')
source=("openrgb::git+https://gitlab.com/CalcProgrammer1/openrgb.git"
        'openrgb.desktop'
        '99-openrgb.rules'
        'openrgb.conf')
sha256sums=('SKIP'
            '3b088475146a17539f60cadb53bdfda92c07d5943ce0d57e0519190612c52507'
            'd7a672fccc7c49112ee5cca4acb0a2d6d848d3518605d9f6fb86d4180b990b7e'
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
    install -Dm755 OpenRGB "$pkgdir"/usr/bin/openrgb
    install -Dm644 qt/OpenRGB.png "$pkgdir"/usr/share/pixmaps/openrgb.png
    install -Dm644 -t "$pkgdir"/usr/share/applications ../openrgb.desktop
    install -Dm644 -t "$pkgdir"/usr/lib/udev/rules.d ../99-openrgb.rules
    install -Dm644 -t "$pkgdir"/usr/lib/modules-load.d ../openrgb.conf
}
