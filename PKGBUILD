# Maintainer: Arisa Snowbell
# Contributor: lis
# Contributor: mis
# Contributor: oslik
# Contributor: Mike_Went
_pkgname="solvespace"
pkgname="${_pkgname}-qt"
pkgver=3.2
pkgrel=1
pkgdesc="A parametric 3d CAD program"
arch=('i686' 'x86_64')
url='http://solvespace.com/'
license=('GPL3')
depends=('json-c' 'glew' 'qt6-base' 'libspnav' 'openmp')
makedepends=('git' 'cmake' 'eigen')
source=("${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init extlib/{libdxfrw,mimalloc,eigen}
    mkdir build
}

build() {
    cd "${srcdir}/${_pkgname}/build"
    cmake .. \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/${_pkgname} \
        -DCMAKE_BUILD_TYPE=Release \
	-DUSE_QT_GUI=ON \
        -DENABLE_OPENMP=ON
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    make DESTDIR="${pkgdir}" install
}
