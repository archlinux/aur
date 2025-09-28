# Maintainer: Adam Honse <calcprogrammer1@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Bo Davidson <bo.davidson@go.tarleton.edu>
# Contributor: Paul Davis <paul@dangersalad.com>
# Contributor: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
pkgver=0.9.1658.g011d364
pkgrel=1
pkgdesc="Open source RGB lighting control that doesn't depend on manufacturer software"
arch=('x86_64')
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'qt5-base' 'libusb' 'hidapi' 'mbedtls' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'git')
optdepends=('i2c-nct6793-dkms: Nuvoton SMBus driver, needed for onboard RGB on certain ASUS Z270 and Z370 boards')
provides=('openrgb')
conflicts=('openrgb')
source=("git+https://gitlab.com/CalcProgrammer1/OpenRGB.git"
        openrgb-modules-load.conf)
sha256sums=('SKIP'
            'b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2')

pkgver() {
    cd OpenRGB
    qmake OpenRGB.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    export CXXFLAGS=${CXXFLAGS/-pipe}

    cd "$srcdir/OpenRGB"
    qmake OpenRGB.pro PREFIX=/usr
    make
}

package() {
    cd OpenRGB
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 "$srcdir"/openrgb-modules-load.conf "$pkgdir"/usr/lib/modules-load.d/openrgb.conf
}
