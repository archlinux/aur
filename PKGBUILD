# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: perlawk

pkgname=dlib
pkgver=19.18
pkgrel=1
pkgdesc="A general purpose cross-platform C++ library designed using contract programming and modern C++ techniques"
arch=('x86_64')
url="http://www.dlib.net"
license=('custom')
depends=('cblas'
         'lapack'
         'libjpeg-turbo'
         'libpng'
         'libx11')
optdepends=('cuda: for CUDA support'
            'cudnn: for CUDNN support'
            'giflib: for GIF support'
            'sqlite: for sqlite support')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/project/dclib/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('521b9fbcb90c328063c439f6ccb3c95d9ababd25b208cbd1b915d9f5c4d2ab9b')

build() {
  cd "${srcdir}"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCUDA_HOST_COMPILER='/opt/cuda/bin/gcc' \
    -DCMAKE_BUILD_TYPE=Release \
    "../${pkgname}-${pkgver}"
  if [[ -f "/usr/lib/ccache/bin/nvcc-ccache" ]] ; then
    cmake \
      -DCUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache \
      -DCUDA_HOST_COMPILER=/usr/lib/ccache/bin/gcc \
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
