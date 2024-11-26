# Maintainer: envolution
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgbase=openbabel-git
pkgname=(openbabel-git python-openbabel-git)
_pkgname=openbabel
pkgver=3.1.1+r6091+g7acf50c9d
pkgrel=1
pkgdesc='A library designed to interconvert between many file formats used in molecular modeling and computational chemistry'
arch=(x86_64)
url='https://openbabel.org/wiki/Main_Page'
license=(GPL)
makedepends=(boost
  cmake
  coordgen
  eigen
  maeparser
  python-setuptools
  rapidjson
  swig
  wxwidgets-gtk3)
source=("${_pkgname}::git+https://github.com/openbabel/openbabel.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  _version=$(git tag --sort=-v:refname --list | head -n1 | tr - . | grep -o '[0-9.]*' | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRUN_SWIG=ON \
    -DPYTHON_BINDINGS=ON
  cmake --build build

  # To split python bindings
  sed -i '/scripts.cmake_install.cmake/d' build/cmake_install.cmake
}

package_openbabel-git() {
  depends=(cairo
    coordgen
    libxml2)
  provides=(openbabel)
  conflicts=(openbabel)
  optdepends=('wxwidgets-gtk3: GUI interface')

  DESTDIR="$pkgdir" cmake --install build
}

package_python-openbabel-git() {
  depends=(openbabel
    python)
  provides=(python-openbabel)
  conflicts=(python-openbabel)

  DESTDIR="$pkgdir" cmake --install build/scripts
}
# vim:set ts=2 sw=2 et:
