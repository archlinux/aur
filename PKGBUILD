# Maintainer: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
pkgver=r620.6d585d3
pkgrel=1
pkgdesc="Configuration utility for RGB lights supporting motherboards, RAM, & peripherals"
arch=('x86_64')
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL2')
depends=('qt5-base' 'libusb' 'hidapi')
makedepends=('git' 'make' 'binutils' 'pkgconf')
optdepends=('i2c-piix4-aura-dkms: AMD motherboard support standalone'
            'linux-openrgb: Patched kernel for AMD & intel'
            'i2c-tools: Motherboard & RAM access')
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

check() {
    mkdir -p $HOME/.config/OpenRGB
}

package() {
    cd "$srcdir/openrgb"
    install -Dm755 OpenRGB "$pkgdir"/usr/bin/openrgb
    install -Dm644 qt/OpenRGB.png "$pkgdir"/usr/share/pixmaps/openrgb.png
    install -Dm644 -t "$pkgdir"/usr/share/applications ../openrgb.desktop
    install -Dm644 -t "$pkgdir"/usr/lib/udev/rules.d 99-openrgb.rules
    install -Dm644 -t "$pkgdir"/usr/lib/modules-load.d ../openrgb.conf
}
