# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
# Contributor: Markus Hovorka <m.hovorka@live.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Matthias Maennich <arch@maennich.net>

_pkgbase=shiboken2
pkgbase=shiboken2-git
pkgname=(shiboken2-git python-shiboken2-git)
_clangver=15.0.7
pkgver=5.15.3
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(LGPL)
makedepends=(clang=$_clangver llvm cmake git libxslt qt5-xmlpatterns python39)
_commit=72d32f66685fbb7fefc41eee629e63f4824cb10b  # tags/v5.15.3-lts-lgpl^0
source=("$_pkgbase::git+https://code.qt.io/pyside/pyside-setup.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgbase"

  mkdir -p build
}

_python=/usr/bin/python3.9

build() {
  # make a venv which has setuptools available
  "$_python" -m venv --system-site-packages pkg-venv

  cmake -B build -S "$_pkgbase/sources/shiboken2" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_TESTS=OFF \
    -DPYTHON_EXECUTABLE=$_python
  cmake --build build
}

package_shiboken2-git() {
  pkgdesc='Generates bindings for C++ libraries using CPython source code (git version)'
  depends=(clang=$_clangver llvm libxslt qt5-xmlpatterns)
  conflicts=(shiboken2)
  provides=(shiboken2=$pkgver)

  DESTDIR="$pkgdir" cmake --install build
# Provided in python-shiboken2
  rm -r "$pkgdir"/usr/lib/{python*,libshiboken*}
# Conflicts with shiboken6 and doesn't work anyway
  rm "$pkgdir"/usr/bin/shiboken_tool.py
}

package_python-shiboken2-git() {
  pkgdesc='Python bindings for shiboken2 (git version)'
  depends=(python39)
  conflicts=(python-shiboken2)
  provides=(python-shiboken2=$pkgver)

  DESTDIR="$pkgdir" cmake --install build
# Provided in shiboken2
  rm -r "$pkgdir"/usr/{bin,include,lib/{cmake,pkgconfig}}

# Install egg-info
  source pkg-venv/bin/activate
  cd "$_pkgbase"
  python setup.py egg_info --build-type=shiboken2
  _pythonpath=$("$_python" -c "from sysconfig import get_path; print(get_path('platlib'))")
  cp -r shiboken2.egg-info "$pkgdir"/$_pythonpath
  deactivate
}
