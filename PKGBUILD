# Maintainer: dreieck
# Contributor: Cirk2

_pkgname=sdbus-cpp
_pkgvariant=basu
pkgname="${_pkgname}-${_pkgvariant}-git"
pkgver=2.2.1+5.r463.d20260115.c2bb343
pkgrel=1
pkgdesc="sdbus-c++ is a high-level C++ D-Bus library for Linux designed to provide expressive, easy-to-use API in modern C++. This package is without systemd dependencies, it uses an extracted version of the sd-bus library (akin to elogind)."
url="https://github.com/Kistler-Group/sdbus-cpp"
arch=('i686' 'x86_64')
license=(
  'LGPL-2.1-or-later'
  'LicenseRef-sdbus-c++_LGPL_Exception_1.0'
)
depends=(
  'basu'
  'expat'
  'gcc-libs'
  'glibc'
  'libcap'
)
makedepends=(
  'cmake'
  'doxygen'
  'git'
  'gperf'
  'meson'
  'ninja'
  'rsync'  # See https://aur.archlinux.org/packages/sdbus-cpp-nosystemd-git#comment-935921
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  "${_pkgname}-${_pkgvariant}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-git"
  "${_pkgname}-${_pkgvariant}"
)
source=("${_pkgname}::git+https://github.com/Kistler-Group/sdbus-cpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed 's|^v||' | awk -F'-' '{print $1}')"
  _subver="$(git describe --tags | awk -F'-' '{print $2}')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  if [ -z ${_ver} ]; then
    error "Error in ${FUNCNAME[0]}: Version information could not determined."
    return 1
  fi
  printf '%s' "${_ver}+${_subver}.r${_rev}.d${_date}.${_hash}"
}

build() {
  cd "${srcdir}/build"

  cmake -S "${srcdir}/${_pkgname}" -B . -GNinja \
    -DCMAKE_INSTALL_PREFIX=/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DSDBUSCPP_SDBUS_LIB=basu \
    -DSDBUSCPP_BUILD_CODEGEN=ON \
    -DSDBUSCPP_BUILD_DOCS=ON \
    -DSDBUSCPP_BUILD_DOXYGEN_DOCS=ON

  cmake --build .
  cmake --build . --target doc
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --install .
  install -Dm644 "${srcdir}/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "${srcdir}/${_pkgname}/COPYING-LGPL-Exception" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-LGPL-Exception"
}

