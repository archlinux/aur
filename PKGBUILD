pkgname=openmodelica
pkgver=1.27.1
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('glibc' 'libgcc' 'libstdc++' 'libgomp' 'libgfortran' 'readline' 'curl' 'blas' 'lapack' 'util-linux-libs' 'boost-libs' 'libffi' 'libglvnd' 'icu' 'openscenegraph' 'qt6-base' 'qt6-httpserver' 'qt6-webengine' 'qt6-svg' 'qt6-5compat' 'zip')
provides=('openmodelica-omc')
makedepends=('gcc-fortran' 'cmake' 'boost' 'java-environment' 'qt6-tools')
options=('!lto')
source=("https://github.com/OpenModelica/OpenModelica/releases/download/v${pkgver}/OpenModelica-v${pkgver}-src-with-submodules.zip")
sha256sums=('4e41ad73b11e47bab5dac54aa83c6bb4edc4a37188ebd93433dee1c02cc17227')

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
