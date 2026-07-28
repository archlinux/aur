# Maintainer: M. Mastroeni <The_Maxtro AT hotmail DOT it>
# Contributor: Xwang <xwaang1976@gmail.com>

pkgname=openmodelica-git
pkgver=r38736.210dbef8e0
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment (git)"
arch=('x86_64')
url="https://www.openmodelica.org"
license=('OSMC-PL')
depends=('glibc' 'libgcc' 'libstdc++' 'libgomp' 'libgfortran' 'readline' 'curl' 'blas' 'lapack' 'util-linux-libs' 'boost-libs' 'libffi' 'libglvnd' 'icu' 'openscenegraph' 'qt6-base' 'qt6-httpserver' 'qt6-webengine' 'qt6-svg' 'qt6-5compat' 'zip')
makedepends=('gcc-fortran' 'cmake' 'boost' 'java-environment' 'qt6-tools' 'git')
provides=('openmodelica')
conflicts=('openmodelica')
options=('!lto')
_giturl=https://github.com/OpenModelica/OpenModelica.git
source=("${pkgname}::git+${_giturl}")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  git remote set-url origin ${_giturl}
  git submodule update --force --init --recursive
}

pkgver() {
  cd $pkgname
  # git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
build() {
  cd $pkgname
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_USE_SYSTEM_LIBFFI=ON -DOM_QT_MAJOR_VERSION=6 -B build .
  cmake --build build
}
 
package() {  
  cd $pkgname
  DESTDIR="${pkgdir}" cmake --build build --target install
  rm -r "${pkgdir}"/usr/share/zmq
  rm -r "${pkgdir}"/usr/share/cminpack
  rm -r "${pkgdir}"/usr/include/cminpack-1
  rm -r "${pkgdir}"/usr/share/cmake
  rm -r "${pkgdir}"/usr/doc
  rm -r "${pkgdir}"/home
}
