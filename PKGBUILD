# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgbase=openbabel
pkgname=(${pkgbase}-git python-${pkgbase}-git)
pkgver=3.0.90.r5774.686ee22f2
pkgrel=1
pkgdesc='A library designed to interconvert between many file formats used in molecular modeling and computational chemistry (git version, builds Python bindings)'
arch=('x86_64')
url='https://github.com/openbabel/openbabel'
license=('GPL')
makedepends=('git' 'cmake' 'eigen' 'wxgtk3' 'boost' 'python' 'swig' 'maeparser' 'rapidjson')
source=("${pkgbase}::git+https://github.com/openbabel/openbabel.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}"
  _parent_ver=$(git tag --sort=version:refname | tail -n 1 | cut -d "-" -f 2- | tr - .)
  _parent_major_ver=$(echo "${_parent_ver}" | cut -d "." -f 1)
  _parent_minor_ver=$(echo "${_parent_ver}" | cut -d "." -f 2)
  _parent_patch_ver=$(echo "${_parent_ver}" | cut -d "." -f 3)
  # Git patch versions always start with 90. Don't use the patch
  # version of the parent tag.
  _git_patch_ver=90
  printf "%s.%s.%s.r%s.%s" \
         "${_parent_major_ver}" \
         "${_parent_minor_ver}" \
         "${_git_patch_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake "${srcdir}/${pkgbase}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
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
