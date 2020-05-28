# Maintainer: Marc Schreiber <info@schrieveslaach.de>
pkgname=libuldaq
url=https://github.com/mccdaq/uldaq
pkgver=1.2.0
pkgrel=3
source=("https://github.com/mccdaq/uldaq/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2" 'https://raw.githubusercontent.com/mccdaq/uldaq/master/LICENSE')
sha256sums=('4911e4d04db7f410028c64c8d7b723c09fadab6dce7757bbb863bc9e10228c5b' 'b2c40923b6662efd3aa16920812653c273ac84934079cd0321f20aae62812eab')
arch=('x86_64')
license=('MIT')
depends=('libusb>=1.0.22')
makedepends=('gcc' 'make' 'libusb')

build() {
    cd "libuldaq-$pkgver"
    ./configure --prefix=/usr
    sed -i '/udevadm/s/^/#/g' Makefile
    sed -i '/ldconfig/s/^/#/g' Makefile
    make -j 4
}

package() {
    cd "libuldaq-$pkgver"
    DESTDIR="$pkgdir/" make install
    cd ..

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Fix place of udev rules from libuldaq
    mkdir -p "$pkgdir/etc"
    mv "$pkgdir/lib/udev/" "$pkgdir/etc/udev/"
    rm -r "$pkgdir/lib"
}

