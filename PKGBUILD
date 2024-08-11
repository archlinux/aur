# Maintainer: Adam Honse <calcprogrammer1@gmail.com>
# Contributor: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
pkgver=r4155.27128373
pkgrel=1
pkgdesc="Configuration utility for RGB lights supporting motherboards, RAM, & peripherals"
arch=('x86_64')
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL2')
depends=('qt5-tools' 'libusb' 'hidapi' 'mbedtls2')
makedepends=('git')
optdepends=('i2c-tools: Motherboard & RAM access')
provides=('openrgb')
conflicts=('openrgb')
source=("git+https://gitlab.com/CalcProgrammer1/OpenRGB.git"
        openrgb.conf
        openrgb.service)
sha256sums=('SKIP'
            'b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2'
            '272dc43a77d0e48d29f32da753c7e05fd635883b173c21047f4eefa8bfc77938')

pkgver() {
    cd OpenRGB
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/OpenRGB"
    export CXXFLAGS=${CXXFLAGS/-pipe}
    qmake OpenRGB.pro PREFIX=/usr
    make -j$(nproc)
}

package() {
    install -Dm644 -t "$pkgdir"/usr/lib/modules-load.d "."/openrgb.conf
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system "."/openrgb.service
    cd OpenRGB
    make INSTALL_ROOT="$pkgdir" install
}
