# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
# Category: science
pkgname='barvinok'
pkgver='0.38'
pkgrel=1
pkgdesc='A library for counting the number of integer points in parametric and non-parametric polytopes'
arch=('i686' 'x86_64')
url='http://freecode.com/projects/barvinok'
license=('GPL')
provides=("$pkgname=$pkgver")
depends=('ntl' 'isl' 'polylib-gmp' 'glpk>4.47')
source=("http://barvinok.gforge.inria.fr/$pkgname-$pkgver.tar.xz")
md5sums=('00c673f214b7262bc2d686143f0009c1')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # hack based on https://github.com/Singular/Sources/commit/de688442dfe449992dc14a000bca0691ecc7e106
    sed -i -e 's/(p))\[1\]/(p.rep))\[1\]/g' conversion.cc 
    sed -i -e 's/(p)) + 2/(p.rep)) + 2/g' conversion.cc
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    env CPPFLAGS="-DNTL_STD_CXX" ./configure --prefix=/usr --with-isl=system --with-polylib=system
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make prefix="$pkgdir"/usr install
}
