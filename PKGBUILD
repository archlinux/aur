pkgname=dlib-nocuda
pkgver=19.21
pkgrel=1
pkgdesc="A general purpose cross-platform C++ library designed using contract programming and modern C++ techniques"
arch=('x86_64')
url="http://dlib.net"
license=('custom')
depends=('cblas'
         'lapack'
         'libjpeg-turbo'
         'libpng'
         'libx11')
optdepends=('giflib: for GIF support'
            'sqlite: for sqlite support')
provides=('dlib')
conflicts=('dlib')
makedepends=('cmake')
source=("http://dlib.net/files/dlib-${pkgver}.tar.bz2")
sha256sums=('be728a03ae8c4dc8b48408d90392a3c28bc6642a6eb22f3885895b434d7df53c')

build() {
    cd "${srcdir}"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_AVX_INSTRUCTIONS=ON \
        -DDLIB_USE_CUDA=OFF \
        "../dlib-${pkgver}"
    make
}

package() {
    cd "${srcdir}/build"
    DESTDIR=${pkgdir} ninja install
    install -Dm644 "../dlib-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
    # remove redundant external libraries
    rm -r "${pkgdir}/usr/include/dlib/external"
}

