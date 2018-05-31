# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: perlawk

pkgname=dlib
pkgver=19.13
pkgrel=2
pkgdesc="A general purpose cross-platform C++ library designed using contract programming and modern C++ techniques"
arch=('x86_64')
url="http://www.dlib.net"
license=('custom')
optdepends=('blas: for BLAS support'
            'cuda: for CUDA support'
            'cudnn: for CUDNN support'
            'giflib: for GIF support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'neon: for neon support'
            'sqlite: for sqlite support')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/project/dclib/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('fe90b94677f837c8f0bcb0bb450b313a422a9171ac682583a75052c58f80ba54')

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
    -DCUDA_HOST_COMPILER='/usr/bin/gcc-7' \
    -DCMAKE_BUILD_TYPE=Release \
    "../${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR=${pkgdir} install
  install -Dm644 "../${pkgname}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
