# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: perlawk

pkgname=dlib
pkgver=19.16
pkgrel=1
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
sha256sums=('37308406c2b1459a70f21ec2fd7bdc922277659534c708323cb28d6e8e4764a8')

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
    -DCUDA_HOST_COMPILER='/opt/cuda/bin/gcc' \
    -DCMAKE_BUILD_TYPE=Release \
    "../${pkgname}-${pkgver}"
  if [[ -f "/usr/lib/ccache/bin/nvcc-ccache" ]] ; then
    cmake \
      -DCUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache \
      -DCUDA_HOST_COMPILER=/usr/lib/ccache/bin/gcc-7 \
      "../${pkgname}-${pkgver}"
  fi
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR=${pkgdir} install
  install -Dm644 "../${pkgname}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
