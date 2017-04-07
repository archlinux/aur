# Maintainer: lithm <lithm at posteo dot de>
# Contributor: mis
# Contributor: oslik
pkgname=solvespace
pkgver=2.3
pkgrel=2
pkgdesc="A parametric 3d CAD program"
arch=('i686' 'x86_64')
url='http://solvespace.com/'
license=('GPL3')
depends=('json-c' 'glew' 'gtkmm')
makedepends=('git' 'cmake')
source=("${pkgname}::git+https://github.com/${pkgname}/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"

    # Backport of https://github.com/solvespace/solvespace/commit/7c2417ab735cf05960939647a2a016fb51f88135
    cd "src"
    sed -i'' -e's/CHAR_WIDTH/CHAR_WIDTH_/g' ui.h textwin.cpp toolbar.cpp
    cd ".."

    mkdir -p build
    cd "extlib"
    git submodule update --init "libdxfrw"
}

build() {
    cd "${srcdir}/${pkgname}/build"
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/${pkgname} \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make DESTDIR="${pkgdir}" install
}
