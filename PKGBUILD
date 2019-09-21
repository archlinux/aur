# Maintainer: Marc Schreiber <info@schrieveslaach.de>
pkgname=libuldaq
url=https://github.com/mccdaq/uldaq
pkgver=1.1.1
pkgrel=1
source=("https://github.com/mccdaq/uldaq/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2" 'https://raw.githubusercontent.com/mccdaq/uldaq/master/LICENSE')
sha256sums=('f7abdab01a9ef0ec72b5b6ba9142326487b3b2ea9f5889cd494cedbc68cb92df' 'b2c40923b6662efd3aa16920812653c273ac84934079cd0321f20aae62812eab')
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
    mv "$pkgdir/lib/udev/" "$pkgdir/etc/udev/"
    rm -r "$pkgdir/lib"
}

