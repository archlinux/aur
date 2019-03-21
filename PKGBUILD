# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='clusteringsuite'
pkgdesc='Automatically expose the main performance trends in applications'\'' computation structure (from BSC).'
pkgver='2.6.8'
pkgrel='3'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPLv2.1')
depends=(libxml2 boost libbsctools)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(dd03a25c03727611260d164ca042c9848bf9d1d21cc71ea5dbbe82ee7322ae47fbecf4ad9bf5e1cfc1bf0612607862f4b8e4166aa271ad42eea244be43b55856)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # This package includes a version of one the libbsctools libraries by default,
    # which causes a conflict as both libraries would need to be installed
    # Basically, the next few lines disable compilation of the version included
    # in this package, and make the package rely on the libbsctools version instead
    sed -i -E '/.*pcfparser_svn3942.*/d' configure.ac
    sed -i -E 's/pcfparser_svn3942//g' Makefile.am
    sed -i -E 's/.*libparavertraceconfig\.la/-lparavertraceconfig/g' src/libSharedComponents/Makefile.am

    autoreconf -i -f -I config
}
build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure \
        --prefix=/usr

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install -j1 # NB: Often fails with parallel install
}
