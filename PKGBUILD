# Maintainer: Hendrik Schilling <hendrik.schilling@posteo.de>
pkgname=ceres-solver-cuda-git
_pkgname=ceres-solver
pkgver=2.2.0.r125.g8c50a34a1
pkgrel=1
pkgdesc="A large scale non-linear optimization library - git build with cuda and cudss"
arch=('i686' 'x86_64')
url="http://ceres-solver.org"
license=('LGPL')
depends=('google-glog' 'suitesparse' 'cudss' 'abseil-cpp')
makedepends=('cmake' 'ninja' 'eigen')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://ceres-solver.googlesource.com/ceres-solver.git")
sha256sums=('SKIP')
options=('staticlibs')

build() {
  cd "${_pkgname}"
  cmake \
      -Bbuild \
      -GNinja \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DEIGENSPARSE=ON \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_BENCHMARKS=OFF

  if [[ ! $NINJAFLAGS ]]; then
    ninja
  else
    ninja "$NINJAFLAGS" -C build
  fi
}

package() {
  cd "${_pkgname}"
  DESTDIR=$pkgdir ninja -C build install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
