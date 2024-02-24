pkgname=openmodelica
pkgver=1.22.2
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('java-environment' 'lapack' 'lapack-static' 'openscenegraph' 'omniorb' 'libcurl-gnutls'
         'lpsolve' 'boost-libs' 'qt5-webengine' 'qt5-xmlpatterns' 'qt5-svg' 'qt5-tools'
         'expat' 'antlr4-runtime')
makedepends=('gcc-fortran' 'cmake' 'git' 'boost')
source=("${pkgname}::git+${_giturl}#tag=v${pkgver}")
sha256sums=('SKIP')

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
        # Correct ownership of files, otherwise FMU export fails
        chmod go+rx "${pkgdir}"/usr/share/omc/runtime/c/fmi/buildproject/config.*
}
