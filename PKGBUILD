# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='stack-of-tasks'
pkgname=eigenpy
pkgver=2.7.14
pkgrel=3
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'python-numpy')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig}
"$url/pull/321.patch"
)
sha256sums=('b98157b78ef8db61e581bc432e44dd851627730626cd01c171e56c70da475ad9'
            'SKIP'
            '106102c2fbca6d5f4e6c9779c63c8f1bf09602303774c4c2d6b1b1c065063881')
validpgpkeys=('A031AD35058955293D54DECEC45D22EF408328AD' 'F182CC432A4752C7A3E4FE02001EB2069D785C81')


prepare() {
    patch -d "$pkgbase-$pkgver" -p1 -i "$srcdir/321.patch"
}

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    #sed -i '/Boost COMPONENTS python3/d' "$pkgdir/usr/lib/cmake/eigenpy/eigenpyConfig.cmake"
}
