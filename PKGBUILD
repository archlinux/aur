# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
# Contributor: Markus Hovorka <m.hovorka@live.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Matthias Maennich <arch@maennich.net>

pkgbase=shiboken2-git
pkgname=(shiboken2-git python-shiboken2-git)
_clangver=15.0.7
pkgver=5.15.3
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL2 LGPL)
pkgdesc='Generates bindings for C++ libraries using CPython source code (git version)'
makedepends=(clang=$_clangver llvm cmake git libxslt qt5-xmlpatterns python39)
_commit=72d32f66685fbb7fefc41eee629e63f4824cb10b  # tags/v5.15.3-lts-lgpl^0
source=("$pkgbase::git+https://code.qt.io/pyside/pyside-setup.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgbase}"

  mkdir -p build
  sed -e 's|0307FFFF|0308FFFF|' -i sources/shiboken2/libshiboken/pep384impl.h # Support python 3.8
}

_python=/usr/bin/python3.9

build() {
  cd "${srcdir}/${pkgbase}/build"

  cmake ../sources/shiboken2 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DUSE_PYTHON_VERSION=3 \
    -DPYTHON_EXECUTABLE=$_python
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
# Conflicts with shiboken6 and doesn't work anyway
  rm "$pkgdir"/usr/bin/shiboken_tool.py
}

package_python-shiboken2-git() {
  depends=(python39)
  conflicts=(python-shiboken2)
  provides=(python-shiboken2)

  cd "${srcdir}/${pkgbase}/build"
  make DESTDIR="$pkgdir" install
# Provided in shiboken2
  rm -r "$pkgdir"/usr/{bin,include,lib/{cmake,pkgconfig}}
}
