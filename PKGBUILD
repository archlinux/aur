# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: perlawk

pkgname=dlib
_pkgname=dlib
pkgver=19.10
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('x86_64')
url="http://www.dlib.net/"
license=('Boost Software License')
makedepends=('cmake')
optdepends=('blas: for BLAS support'
            'cuda: for CUDA support'
            'cudnn: for CUDNN support'
            'giflib: for GIF support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'neon: for neon support'
            'sqlite: for sqlite support')
source=(https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
sha512sums=('04b1513f09bf43677ad5b59d76fe7aa9cd96c6d7d1aac2fb0f431a555ccc670996a30660a8bf50eea082842f623b68f1ac019058b351750c0d86f8f0b355891b')

build() {
    cd "${srcdir}"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib \
        -DBUILD_SHARED_LIBS:BOOL=ON \
        -DUSE_AVX_INSTRUCTIONS:BOOL=ON \
        -DUSE_SSE2_INSTRUCTIONS:BOOL=ON \
        -DUSE_SSE4_INSTRUCTIONS:BOOL=ON \
        -DCUDA_HOST_COMPILER='/usr/bin/cc-6' \
        -DCMAKE_BUILD_TYPE=Release \
        "../${_pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR=${pkgdir} install
    install -Dm644 "../${_pkgname}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
