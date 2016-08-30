# Slightly modified from the official version by Sven-Hendrik Haase
pkgname=arrayfire-git
pkgdesc="High performance software library for parallel computing with an easy-to-use API"
url='http://arrayfire.com'
pkgver=3.3.2
arch=('i686' 'x86_64')
pkgrel=3
license=('BSD')
makedepends=('cmake' 'doxygen' 'git')
depends=('cblas' 'fftw' 'lapack' 'freeimage' 'gcc5')
optdepends=('cuda: Required for using CUDA backend'
            'nvidia-utils: Required for using CUDA backend'
            'libclc: Required for using OpenCL backend')
source=(git+https://github.com/arrayfire/arrayfire)
md5sums=('SKIP')
provides=('arrayfire=${pkgver}' 'forge')
conflicts=('arrayfire' 'forge')

check() {
  cd "${srcdir}/arrayfire/build"
}

build() {
  cd "${srcdir}/arrayfire/"
  git checkout v${pkgver}
  git submodule init
  git submodule update

  rm -rf build
  mkdir build && cd build

  #Autodetects available backends
  CC=/usr/bin/gcc-5\
  CFLAGS="-D__STRICT_ANSI__"\
  CXXFLAGS="-D__STRICT_ANSI__"\
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_TEST=OFF\
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_DOCS=ON      \
      -DBUILD_GRAPHICS=OFF

  make
}

package() {
  cd "${srcdir}/arrayfire"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd build

  make DESTDIR="${pkgdir}/" install
}
