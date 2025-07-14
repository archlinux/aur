# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: envolution (https://aur.archlinux.org/account/envolution)
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# shellcheck disable=SC2034,SC2154

pkgbase=openbabel-git
pkgname=(openbabel-git python-openbabel-git)
_pkgname=openbabel
pkgver=3.1.1+r6136+g889c350fe
pkgrel=2
pkgdesc='A library designed to interconvert between many file formats used in molecular modeling and computational chemistry'
arch=(x86_64)
url='https://openbabel.org/'
license=(GPL-2.0-only)
makedepends=(
  boost
  cmake
  coordgen
  eigen
  git
  maeparser
  python-setuptools
  rapidjson
  swig
  wxwidgets-gtk3
)
depends=(
  gcc-libs
  glibc
)
source=("${_pkgname}::git+https://github.com/openbabel/openbabel.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit 1
  _version=$(git tag --sort=-v:refname --list | head -n1 | tr - . | grep -o '[0-9.]*' | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd openbabel || exit 1
  sed -e '/SET CMP0042 OLD/d' -i CMakeLists.txt
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
