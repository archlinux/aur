pkgname=openmodelica
pkgver=1.22.3
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('java-environment' 'lapack' 'openscenegraph' 'boost-libs' 'qt5-webengine' 'qt5-xmlpatterns' 'qt5-svg' 'qt5-tools')
makedepends=('gcc-fortran' 'cmake' 'git' 'boost')
source=("${pkgname}::git+${_giturl}#tag=v${pkgver}")
sha256sums=('ac0ecb0cec22823ac35c8a1b13d3894c223c77e13d81c301058cc6966a12d5f9')

prepare() {
        cd "${pkgname}"
        git remote set-url origin ${_giturl}
        git submodule update --force --init --recursive
}

build() {
        cd "${pkgname}"
        cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOM_USE_CCACHE=OFF -DOM_OMEDIT_ENABLE_QTWEBENGINE=ON -B build .
        make -C build
}

package() {
        cd "${pkgname}"
        make install -C build DESTDIR=${pkgdir}
        rm -r "${pkgdir}"/usr/share/zmq
}
