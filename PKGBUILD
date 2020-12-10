# Maintainer: pingplug < aur at pingplug dot me >
# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: perlawk

pkgbase=dlib
pkgname=("dlib" "dlib-cuda")
pkgver=19.21
pkgrel=4
pkgdesc="A general purpose cross-platform C++ library designed using contract programming and modern C++ techniques"
arch=('x86_64')
url="http://dlib.net"
license=('custom')
depends=('cblas'
         'lapack'
         'blas'
         'libjpeg-turbo'
         'libpng'
         'libx11')
optdepends=('giflib: for GIF support'
            'sqlite: for sqlite support')
makedepends=('cmake' 'ninja' 'cuda' 'cudnn')
source=("http://dlib.net/files/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('be728a03ae8c4dc8b48408d90392a3c28bc6642a6eb22f3885895b434d7df53c')

build() {
    cd "${srcdir}"
    mkdir -p build && cd build
    cmake -GNinja \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_AVX_INSTRUCTIONS=ON \
        -DDLIB_USE_CUDA=OFF \
        "../${pkgbase}-${pkgver}"
    ninja ${MAKEFLAGS:--j1}

    cd "${srcdir}"
    mkdir -p build-cuda && cd build-cuda
    cmake -GNinja \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_AVX_INSTRUCTIONS=ON \
        -DDLIB_USE_CUDA=ON \
        "../${pkgbase}-${pkgver}"
    ninja ${MAKEFLAGS:--j1}
}

package_dlib() {
    cd "${srcdir}/build"
    DESTDIR=${pkgdir} ninja install
    install -Dm644 "../${pkgbase}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
    # remove redundant external libraries
    rm -r "${pkgdir}/usr/include/dlib/external"
}

package_dlib-cuda() {
    pkgdesc="A general purpose cross-platform C++ library designed using contract programming and modern C++ techniques (with CUDA)"
    depends+=(cuda cudnn)
    conflicts=(dlib)
    cd "${srcdir}/build-cuda"
    DESTDIR=${pkgdir} ninja install
    install -Dm644 "../${pkgbase}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
    # remove redundant external libraries
    rm -r "${pkgdir}/usr/include/dlib/external"
}
