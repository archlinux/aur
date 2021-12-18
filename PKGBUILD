# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

pkgname=printer-driver-ptouch
pkgver=1.6
pkgrel=2
pkgdesc='P-Touch PT-series and QL-series printer driver for Linux (under CUPS)'
arch=('i686' 'x86_64')
url='https://github.com/philpem/printer-driver-ptouch'
license=('GPL')

depends=('ghostscript')
makedepends=('autoconf' 'libcups' 'foomatic-db-engine')

source=("$pkgname-$pkgver.tar.gz::https://github.com/philpem/printer-driver-ptouch/archive/v$pkgver.tar.gz")
sha256sums=('ee1b53cf89b63a065683456a58ba20c28c5d4c966c4ff8e0883601dbf35caa82')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    autoreconf --force
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install

    # Compile and remove foomatic database
    mkdir -p "$pkgdir/usr/share/ppd/"
    echo "dummy dummy" > "$pkgdir/usr/share/foomatic/db/oldprinterids"
    FOOMATICDB="$pkgdir/usr/share/foomatic" foomatic-compiledb -t ppd -d "$pkgdir/usr/share/ppd/Brother/"
    rm -r "$pkgdir/usr/share/foomatic/"
}
