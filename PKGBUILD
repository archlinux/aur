# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>

_pkgname=speedcrunch
pkgname="${_pkgname}"-git
pkgver=0.12.0.r695.g05d4f0f7
pkgrel=1
pkgdesc="Simple, high precision and powerful calculator."
arch=('i686' 'x86_64' 'aarch64')
url="https://www.speedcrunch.org/"
license=('GPL-2.0-only')
depends=('qt6-tools')
makedepends=('git' 'cmake' 'python-sphinx')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://bitbucket.org/heldercorreia/speedcrunch.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "0.12.0.r%s.%s" "$(git rev-list 0e9c32a2cc445affd5887cf98515603a3168fa5c..HEAD | wc -l)" "$(git describe --tags | sed 's|^.*-||')"
}

prepare() {
    cd "${_pkgname}"
    sed -i 's|GitHub light|GitHub Light|' src/resources/speedcrunch.qrc
    sed -i 's|QHELPGENERATOR := qhelpgenerator|QHELPGENERATOR := /usr/lib/qt6/qhelpgenerator|' doc/src/Makefile
    cd doc/src
    make build-bundled
}

build() {
    cd "${_pkgname}"
    rm -rf build && mkdir build
    cd build
    cmake ../src -DCMAKE_INSTALL_PREFIX=/usr -DHTML_DOCS_DIR=../doc/src/_build-bundled
    make
}

package() {
    cd "${_pkgname}"
    cd build
    make DESTDIR="${pkgdir}" install
}
