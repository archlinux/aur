# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Markus Hovorka <m.hovorka@live.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: kachelaqa <kachelaqa at gmail dot com>

pkgname=pyside2-tools-git
pkgver=r6554.6eb583d7
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(LGPL)
pkgdesc='lupdate, rcc and uic tools for PySide2 (git version)'
depends=(pyside2)
makedepends=(cmake shiboken2 git)
conflicts=(pyside2-tools)
provides=(pyside2-tools)
source=("${pkgname}::git+https://code.qt.io/pyside/pyside-setup.git"
        "git+https://code.qt.io/pyside/pyside-tools.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule init
  git config submodule.sources/pyside2-tools.url "${srcdir}/pyside-tools"
  git submodule update

  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}/build"

  cmake ../sources/pyside2-tools \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  
  make DESTDIR="$pkgdir" install
}
