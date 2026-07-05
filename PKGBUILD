pkgname=openmodelica
pkgver=1.27.0
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('glibc' 'libgcc' 'libstdc++' 'libgomp' 'libgfortran' 'readline' 'curl' 'blas' 'lapack' 'util-linux-libs' 'boost-libs' 'libffi' 'libglvnd' 'icu' 'openscenegraph' 'qt6-base' 'qt6-httpserver' 'qt6-webengine' 'qt6-svg' 'qt6-5compat')
provides=('openmodelica-omc')
makedepends=('gcc-fortran' 'cmake' 'boost' 'java-environment' 'qt6-tools')
options=('!lto')
source=("https://github.com/OpenModelica/OpenModelica/releases/download/v${pkgver}/OpenModelica-v${pkgver}-src-with-submodules.zip")
sha256sums=('8bb23c0ae3dc1e8b2eed84f2ee24b0014ba837015a9230a5e0237d6789071bff')

prepare() {
  cd "OpenModelica-v${pkgver}"
  curl -L https://github.com/OpenModelica/OpenModelica/pull/15916.patch | patch -p1
  curl -L https://github.com/OpenModelica/OpenModelica/pull/15991.patch | patch -p1
}

build() {
  cd "OpenModelica-v${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_USE_SYSTEM_LIBFFI=ON -DOM_QT_MAJOR_VERSION=6 -B build .
  cmake --build build
}

package() {
  cd "OpenModelica-v${pkgver}"
  DESTDIR="${pkgdir}" cmake --build build --target install
  rm -r "${pkgdir}"/usr/share/zmq
  rm -r "${pkgdir}"/usr/share/cminpack
  rm -r "${pkgdir}"/usr/include/cminpack-1
  rm -r "${pkgdir}"/usr/share/cmake
  rm -r "${pkgdir}"/usr/doc
  rm -r "${pkgdir}"/home
}
