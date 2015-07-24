# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

# Based off the ABS PKGBUILD in [extra]/openbabel.

pkgname=openbabel-git
_name=openbabel
pkgver=2.3.90.r4215.3dda994
pkgrel=1
pkgdesc="A library designed to interconvert between many file formats used in molecular modeling and computational chemistry (git version, builds Python bindings)"
arch=("i686" "x86_64")
url="http://openbabel.org/wiki/Main_Page"
license=("GPL")
depends=("libxml2" "libsm")
makedepends=("git" "cmake" "eigen2" "wxgtk2.8" "boost" "swig" "python")
optdepends=("eigen2: to use bindings"
            "wxgtk2.8: GUI interface")
provides=("${_name}")
conflicts=("${_name}" "python-${_name}")
source=("${_name}::git+https://github.com/openbabel/openbabel.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
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
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  cmake "${srcdir}/${_name}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.8 \
    -DRUN_SWIG=ON \
    -DPYTHON_BINDINGS=ON

  make
}

check() {
  NCPUS=$(nproc)
  cd "${srcdir}/build"
  ctest -j${NCPUS}
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
