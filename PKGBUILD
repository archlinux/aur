# Maintainer: Adam Honse <calcprogrammer1@gmail.com>
# Contributor: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
pkgver=0.9.r908.g2712837
pkgrel=1
pkgdesc="Configuration utility for RGB lights supporting motherboards, RAM, & peripherals"
arch=('x86_64')
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL-2.0-only')
depends=('qt5-tools' 'libusb' 'hidapi' 'mbedtls2')
makedepends=('git')
optdepends=('i2c-nct6793-dkms: Nuvoton SMBus driver, needed for onboard RGB on certain ASUS Z270 and Z370 boards')
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
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/OpenRGB"
    export CXXFLAGS=${CXXFLAGS/-pipe}
    qmake OpenRGB.pro PREFIX=/usr
    make
}

package() {
    install -Dm644 -t "$pkgdir"/usr/lib/modules-load.d "."/openrgb.conf
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system "."/openrgb.service
    cd OpenRGB
    make INSTALL_ROOT="$pkgdir" install
}
