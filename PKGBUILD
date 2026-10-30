pkgname=openmodelica-omc
pkgver=1.27.2
pkgrel=1
pkgdesc="The Open Source Modelica Suite - OpenModelica Compiler"
arch=('x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
_giturl="https://github.com/OpenModelica/OpenModelica.git"
groups=(openmodelica)
conflicts=(openmodelica)
depends=('glibc' 'libgcc' 'libstdc++' 'libgomp' 'libgfortran' 'readline' 'curl' 'blas' 'lapack' 'util-linux-libs' 'boost-libs' 'libffi')
makedepends=('gcc-fortran' 'cmake' 'boost' 'java-environment')
options=('!lto')
source=("https://github.com/OpenModelica/OpenModelica/releases/download/v${pkgver}/OpenModelica-v${pkgver}-src-with-submodules.zip")
sha256sums=('b724e7deba511d888c29f7e150abb2865522cdf9bb39d2ed84c653cbdffd20e6')

prepare() {
  cd "$srcdir/OpenModelica-v${pkgver}"
  curl -L https://github.com/OpenModelica/OpenModelica/pull/15916.patch | patch -p1
  curl -L https://github.com/OpenModelica/OpenModelica/pull/15991.patch | patch -p1
}

build() {
  cd "$srcdir/OpenModelica-v${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_USE_SYSTEM_LIBFFI=ON -DOM_ENABLE_GUI_CLIENTS=OFF -B build .
  cmake --build build
}

package() {
  cd "$srcdir/OpenModelica-v${pkgver}"
  DESTDIR="${pkgdir}" cmake --build build --target install
  rm "${pkgdir}"/usr/include/omc/omsicpp/Core/Modelica.h.gch
  rm -r "${pkgdir}"/usr/share/zmq
  rm -r "${pkgdir}"/usr/share/cminpack
  rm -r "${pkgdir}"/usr/include/cminpack-1
  rm -r "${pkgdir}"/usr/share/cmake
  rm -r "${pkgdir}"/home
}
