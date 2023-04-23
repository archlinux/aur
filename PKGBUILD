pkgname=openmodelica
pkgver=1.21.0
pkgrel=1
pkgdesc="Open-source Modelica-based modeling and simulation environment"
url="https://www.openmodelica.org"
_giturl="https://github.com/OpenModelica/OpenModelica.git"
license=('OSMC-PL')
arch=('x86_64')
depends=('java-environment' 'lapack' 'lapack-static' 'openscenegraph' 'omniorb' 'libcurl-gnutls'
         'lpsolve' 'boost-libs' 'qt5-webkit' 'qt5-xmlpatterns' 'qt5-svg' 'qt5-tools'
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
        autoreconf -fi
        ./configure --prefix=/usr --without-omc
        make
}

package() {
        cd "${pkgname}"
        make install DESTDIR=${pkgdir}
        # Correct ownership of files, otherwise FMU export fails
        chmod go+rx "${pkgdir}"/usr/share/omc/runtime/c/fmi/buildproject/config.*
}
