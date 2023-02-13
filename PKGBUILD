# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=pycppad
pkgver=1.2.2
pkgrel=1
pkgdesc="CppAD python bindings"
arch=('i686' 'x86_64')
url="https://github.com/Simple-Robotics/$pkgname"
license=('BSD')
depends=('boost-libs' 'eigenpy' 'cppad' 'cppadcodegen')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'python-numpy')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('31c042a132a9f6cc17d15b9a12a90f7118126707c4e5d5eff677644ae746c345'
            'SKIP')
validpgpkeys=('A031AD35058955293D54DECEC45D22EF408328AD' 'F182CC432A4752C7A3E4FE02001EB2069D785C81')

prepare() {
    sed -i "/FINDPYTHON/d" "$pkgname-$pkgver/CMakeLists.txt"
    sed -i "/SEARCH_FOR_BOOST_PYTHON/d" "$pkgname-$pkgver/CMakeLists.txt"
}

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DBUILD_WITH_CPPAD_CODEGEN_BINDINGS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
