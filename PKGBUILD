# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: perlawk

pkgname=dlib
pkgver=19.17
pkgrel=2
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
sha256sums=('24772f9b2b99cf59a85fd1243ca1327cbf7340d83395b32a6c16a3a16136327b')

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
