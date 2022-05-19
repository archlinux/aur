# Maintainer: int <int [ate] arcor [dot] de>
#
# NOTE: A test fails with libxslt version 1.1.35.
#       So when using this package downgrade and pin libxslt to a previous version.
#
pkgname=zebra
_dlname=idzebra
pkgver=2.2.3
pkgrel=1
pkgdesc="A high-performance, general-purpose structured text indexing and retrieval engine."
arch=('i686' 'x86_64')
url="http://www.indexdata.com/zebra/"
license=('GPL')
depends=('bzip2' 'expat' 'perl' 'yaz>=3.0.47' 'libxslt<=1.1.34' 'tcl')
source=("http://ftp.indexdata.dk/pub/zebra/${_dlname}-${pkgver}.tar.gz")
sha512sums=('c2c55c7883e73277615dd65488fae5f3c00a9fed017e619ce278e68787e87ef7ef349c0a55e4b1e9c572e7114b0dc0a230ac31895220ce3c01b0e356660a53fd')

prepare() {
    cd "$_dlname-$pkgver"
}

build() {
    cd "$_dlname-$pkgver"

    # --with-yaz=pkg means use pkgconfig instead of yaz-config
    ./configure --prefix=/usr \
        --with-yaz=pkg \
        --without-docbook-dtd --without-docbook-dsssl --without-docbook-xsl \
        --with-iconv
    make
}

check() {
    cd "$_dlname-$pkgver"
    make -k check
}

package() {
    cd "$_dlname-$pkgver"
    make DESTDIR="$pkgdir/" install

    # libtool warning in the last "make install" step
    # says to do the following:
    libtool --finish "$pkgdir/usr/lib"
}
