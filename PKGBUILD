# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: perlawk

pkgname=dlib
pkgver=19.20
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
optdepends=('cuda: for CUDA support'
            'cudnn: for CUDNN support'
            'giflib: for GIF support'
            'sqlite: for sqlite support')
makedepends=('cmake')
source=("http://dlib.net/files/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('df9aa456ed5e190597fa8dafc1471670ced0128d0f115f2be7677c9c42f4328d')

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
