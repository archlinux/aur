
# Maintainer: Luca Fulchir <luker at fenrirproject.org>

pkgname=lparse
pkgver=1.1.2
pkgrel=2
pkgdesc="Lparse is a front-end to smodels that generates a variable-free simple logic"
arch=('i686' 'x86_64')
url="http://www.tcs.hut.fi/Software/smodels/"
license=('GPL2')
source=("http://www.tcs.hut.fi/Software/smodels/src/${pkgname}-${pkgver}.tar.gz" 'configure.patch')
sha1sums=('c7d4bae84e37066e221f44c17b4df120f511bd14'
          'b7de54b05889d53e44b01a52ad7e67b69fc6572e')
sha256sums=('886d29723f7188296e48584a4a32b8f111414acb7ca8490af28ef6b7f1717298'
            'ad3d07202ad5be2ae8adff5e32f99f72f30f230ed8ae56aa45c547a1777f0d9e')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"

    # just a couple of bugs...
    patch -p1 < "${srcdir}/configure.patch"
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    ./configure	--prefix=/usr
    cd src
    sed -i 's|^CFLAGS=\(.*\)|CFLAGS=-std=c++98 \1|' Makefile
    cd ..
    make
    cd lib
    make
    cd ..
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p ${pkgdir}/usr/{bin,lib,share/doc/${pkgname}}
    cp src/lparse ${pkgdir}/usr/bin/
    cp lib/liblparse.so ${pkgdir}/usr/lib/
    cp -a examples ${pkgdir}/usr/share/doc/${pkgname}/
    cp doc/lparse.ps ${pkgdir}/usr/share/doc/${pkgname}/
}



