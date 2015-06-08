# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
# Category: science
pkgname='barvinok'
pkgver='0.37'
pkgrel=3
pkgdesc='A library for counting the number of integer points in parametric and non-parametric polytopes'
arch=('i686' 'x86_64')
url='http://freecode.com/projects/barvinok'
license=('GPL')
provides=("$pkgname=$pkgver")
depends=('ntl' 'isl' 'polylib' 'glpk>4.47')
source=("http://barvinok.gforge.inria.fr/$pkgname-$pkgver.tar.xz"
        "glpk_new_api.patch::http://repo.or.cz/w/barvinok.git/patch/1192e00b23670c71a436f065c58f5524e80142b9")
md5sums=('e88db73831f0797738b25f6da1b6ebff'
         'f88b4192cdc4228d956212e8d2e150f8')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # hack based on https://github.com/Singular/Sources/commit/de688442dfe449992dc14a000bca0691ecc7e106
    sed -i -e 's/(p))\[1\]/(p.rep))\[1\]/g' conversion.cc 
    sed -i -e 's/(p)) + 2/(p.rep)) + 2/g' conversion.cc
   
    # For compatibility with GLKP >= 4.47 - patch from barvinok.git repo
    patch -p1 -i ../glpk_new_api.patch
    aclocal
    automake --add-missing
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
