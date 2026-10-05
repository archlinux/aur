# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>

_pkgname=speedcrunch
pkgname="${_pkgname}"-git
pkgver=1.0.0.r2.g2acd0f7b
pkgrel=1
pkgdesc="Simple, high precision and powerful calculator."
arch=('i686' 'x86_64' 'aarch64')
url="https://www.speedcrunch.org/"
license=('GPL-2.0-only')
depends=('qt6-tools')
makedepends=('git' 'cmake' 'python-sphinx')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/heldercorreia/speedcrunch.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --always | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "${_pkgname}"
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
