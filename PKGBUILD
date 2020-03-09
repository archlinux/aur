# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

pkgname=printer-driver-ptouch
pkgver=1.4.2
pkgrel=4
_commit=5fe72de0577215eb04a6fcbe49b24bcf5e228dec
pkgdesc='printer driver Brother P-touch label printers'
arch=('i686' 'x86_64')
url='https://github.com/philpem/printer-driver-ptouch'
license=('GPL')

depends=('ghostscript' 'foomatic-db')
makedepends=('autoconf' 'libcups' 'foomatic-db-engine')

source=("https://github.com/philpem/printer-driver-ptouch/archive/5fe72de0577215eb04a6fcbe49b24bcf5e228dec.tar.gz"
        'Add-include-cups-ppd.h.patch'
        'Add-PT-2430PC.patch')
sha256sums=('d12c4cdd57013536e2803a8d9579cb2260c29a225ac23c7868016549c3d6b06b'
            '22721f6f371114f8725b70cc2877276bce1a38eb9680dcaa7d268eba990e8b4c'
            '363313b9cce5a223ab4a72e7423f32d73b17bafc334454a99da8c0c1363983ca')

prepare() {
    cd "$srcdir/$pkgname-$_commit"

    patch -p1 < ../Add-include-cups-ppd.h.patch
    patch -p1 < ../Add-PT-2430PC.patch
}

build() {
    cd "$srcdir/$pkgname-$_commit"

    autoreconf --force
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$_commit"

    make DESTDIR="$pkgdir/" install

    # Remove files already installed by foomatic-db
    for printer in PT-1500PC PT-18R PT-1950VP PT-1950 PT-1960 PT-2300 \
                   PT-2420PC PT-2450DX PT-2500PC PT-2600 PT-2610 PT-3600 \
                   PT-550A PT-9200DX PT-9200PC PT-9400 PT-9500PC PT-9600 \
                   PT-PC QL-500 QL-550 QL-650TD; do
        rm "$pkgdir/usr/share/foomatic/db/source/printer/Brother-$printer.xml"
    done
}
