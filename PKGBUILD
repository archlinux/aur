# Maintainer: Jose Luis Cercos Pita <jlcercos@gmail.com>
pkgname=moordyn
pkgver=2.4.0
pkgrel=1
pkgdesc="MoorDyn is a lumped-mass model for simulating the dynamics of mooring systems connected to floating offshore structures"
arch=('x86_64')
url="https://github.com/FloatingArrayDesign/MoorDyn"
license=('BSD-3-Clause')
groups=()
depends=(gcc-libs glibc vtk)
makedepends=(git cmake base-devel gcc-fortran)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
_tag=v${pkgver}
_sourceName="MoorDyn"
source=("git+${url}.git#tag=${_tag}")
noextract=()
sha256sums=('4d8965512166021bbf6ca2de9d60e453e7229f1533fb0f1dcfc2b0f0180043df')

pkgver() {
  cd "${_sourceName}"
  git describe --tags | sed 's/^v//'
}

build() {
  mkdir -p build
  
  cmake \
    -B build -S ${_sourceName} \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -DEXTERNAL_EIGEN:BOOL=OFF \
    -DPYTHON_WRAPPER:BOOL=OFF \
    -DFORTRAN_WRAPPER:BOOL=ON \
    -DRUST_WRAPPER:BOOL=OFF \
    -DUSE_VTK=ON \
    -DBUILD_TESTING=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -D -m644 "${_sourceName}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
