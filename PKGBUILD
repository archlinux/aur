# Maintainer: envolution
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgbase=openbabel
pkgname=(${pkgbase}-git python-${pkgbase}-git)
pkgver=3.1.1+r6091+g7acf50c9d
pkgrel=1
pkgdesc='A library designed to interconvert between many file formats used in molecular modeling and computational chemistry (git version, builds Python bindings)'
arch=('x86_64')
url='https://github.com/openbabel/openbabel'
license=('GPL')
makedepends=('git' 'cmake' 'eigen' 'wxgtk3' 'boost' 'python' 'swig' 'maeparser' 'rapidjson')
source=("${pkgbase}::git+https://github.com/openbabel/openbabel.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${pkgbase}"
  _version=$(git tag --sort=-v:refname --list | head -n1 | sed 's/-/./g' | grep -o '[0-9.]*' | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

build() {
  mkdir -p build && cd build

  cmake "../${pkgbase}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -DRUN_SWIG=ON \
    -DPYTHON_BINDINGS=ON

  make

  # To split python bindings
  sed -i '/scripts.cmake_install.cmake/d' cmake_install.cmake
}

package_openbabel-git() {
  depends=('wxgtk3' 'maeparser')
  provides=("${pkgbase}")
  conflicts=("${pkgbase}")

  cd build
  make DESTDIR="${pkgdir}" install
}

package_python-openbabel-git() {
  depends=('python' 'openbabel')
  provides=("python-${pkgbase}")
  conflicts=("python-${pkgbase}")

  cd build/scripts
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
