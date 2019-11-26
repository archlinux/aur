# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
# Contributor: Markus Hovorka <m.hovorka@live.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Matthias Maennich <arch@maennich.net>

pkgbase=shiboken2-git
pkgname=(shiboken2-git python-shiboken2-git)
_clangver=9.0.0
pkgver=r6554.6eb583d7
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL2 LGPL)
pkgdesc='Generates bindings for C++ libraries using CPython source code'
makedepends=(clang llvm cmake git libxslt qt5-xmlpatterns python-sphinx)
source=("$pkgbase::git+https://code.qt.io/pyside/pyside-setup.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgbase}"

  mkdir -p build
  sed -e 's|0307FFFF|0308FFFF|' -i sources/shiboken2/libshiboken/pep384impl.h # Support python 3.8
}

build() {
  cd "${srcdir}/${pkgbase}/build"

  cmake ../sources/shiboken2 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DUSE_PYTHON_VERSION=3
  make
}

package_shiboken2-git() {
  depends=(clang=$_clangver llvm libxslt qt5-xmlpatterns)
  conflicts=(shiboken2)
  provides=(shiboken2)

  cd "${srcdir}/${pkgbase}/build"
  make DESTDIR="$pkgdir" install
# Provided in python-shiboken2
  rm -r "$pkgdir"/usr/lib/{python*,libshiboken*}
}

package_python-shiboken2-git() {
  depends=(python)
  conflicts=(python-shiboken2)
  provides=(python-shiboken2)

  cd "${srcdir}/${pkgbase}/build"
  make DESTDIR="$pkgdir" install
# Provided in shiboken2
  rm -r "$pkgdir"/usr/{bin,include,lib/{cmake,pkgconfig},share}
}
