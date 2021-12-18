# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

pkgname=printer-driver-ptouch
pkgver=1.6
pkgrel=1
pkgdesc='P-Touch PT-series and QL-series printer driver for Linux (under CUPS)'
arch=('i686' 'x86_64')
url='https://github.com/philpem/printer-driver-ptouch'
license=('GPL')

depends=('ghostscript')
makedepends=('autoconf' 'libcups' 'foomatic-db-engine')

source=("$pkgname-$pkgver.tar.gz::https://github.com/philpem/printer-driver-ptouch/archive/v$pkgver.tar.gz")
sha256sums=('67d6ef706fd9680a4f6d50a7dae54a3afa98e8847c0013ae6a024ca88291ebb2')

build() {
    cd "$srcdir/ptouch-driver-$pkgver"

    autoreconf --force
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/ptouch-driver-$pkgver"

    make DESTDIR="$pkgdir/" install

    # Compile and remove foomatic database
    mkdir -p "$pkgdir/usr/share/ppd/"
    echo "dummy dummy" > "$pkgdir/usr/share/foomatic/db/oldprinterids"
    FOOMATICDB="$pkgdir/usr/share/foomatic" foomatic-compiledb -t ppd -d "$pkgdir/usr/share/ppd/Brother/"
    rm -r "$pkgdir/usr/share/foomatic/"
}
