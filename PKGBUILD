# Maintainer: Adam Honse <calcprogrammer1@gmail.com>
# Contributor: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
pkgver=0.9.1433.ge86d9f9
pkgrel=1
pkgdesc="Configuration utility for RGB lights supporting motherboards, RAM, & peripherals"
arch=('x86_64')
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL-2.0-only')
depends=('qt5-tools' 'libusb' 'hidapi' 'mbedtls')
makedepends=('git')
optdepends=('i2c-nct6793-dkms: Nuvoton SMBus driver, needed for onboard RGB on certain ASUS Z270 and Z370 boards')
provides=('openrgb')
conflicts=('openrgb')
source=("git+https://gitlab.com/CalcProgrammer1/OpenRGB.git"
        openrgb.conf)
sha256sums=('SKIP'
            'b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2')

pkgver() {
    cd OpenRGB
    qmake OpenRGB.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGB"
    export CXXFLAGS=${CXXFLAGS/-pipe}
    qmake OpenRGB.pro PREFIX=/usr
    make
}

package() {
    install -Dm644 -t "$pkgdir"/usr/lib/modules-load.d "."/openrgb.conf
    cd OpenRGB
    make INSTALL_ROOT="$pkgdir" install
}
