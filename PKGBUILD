# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
# Contributor: bartus <szczepaniak.bartek+github@gmail.com>
pkgname=teem
pkgver=1.11.0
pkgrel=4
pkgdesc='Group of libraries for processing scientific raster data.'
arch=('x86_64')
url='http://teem.sourceforge.net/index.html'
license=('LGPL')
depends=()
optdepends=()
makedepends=('cmake')
source=(
    "https://sourceforge.net/projects/teem/files/teem/${pkgver}/teem-${pkgver}-src.tar.gz/download"
    "cmake.patch"
)
sha256sums=('a01386021dfa802b3e7b4defced2f3c8235860d500c1fa2f347483775d4c8def'
            'e7dac798204c7a832839f52a7e339d46ed3207a6c762c2e4c8b12e842685c66c')

prepare() {
    cd "$srcdir/$pkgname-$pkgver-src"

    # Fix CMake config to install CMake files in the right place
    patch -Np1 -i "$srcdir"/cmake.patch

    mkdir build || :
    cd build

    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DBUILD_SHARED_LIBS:BOOL=ON \
        ..
}

build() {
    cd "$srcdir/$pkgname-$pkgver-src/build"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver-src/build"
    make install DESTDIR="$pkgdir"

    install -D -m644 \
        "${srcdir}/$pkgname-$pkgver-src/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

