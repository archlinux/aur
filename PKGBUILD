# Maintainer: dreieck
# Contributor: Cirk2

_pkgname=sdbus-cpp
_pkgvariant=nosystemd
pkgname="${_pkgname}-${_pkgvariant}-git"
_pkgver=latest
pkgver=0.8.3.43.r271.d20210923.a341754
pkgrel=1
pkgdesc="sdbus-c++ is a high-level C++ D-Bus library for Linux designed to provide expressive, easy-to-use API in modern C++. This package is without systemd dependencies; it will have it's own static libsystemd baked in."
url="https://github.com/Kistler-Group/sdbus-cpp"
arch=('i686' 'x86_64')
license=('LGPL2.1' 'custom:sdbus-c++ LGPL Exception 1.0')
depends=(
  'expat'
  'libcap'
)
makedepends=(
  'cmake'
  'doxygen'
  'git'
  'gperf'
  'meson'
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
source=(
  "${_pkgname}::git+git://github.com/Kistler-Group/sdbus-cpp.git"
  "systemd-stable::git+git://github.com/systemd/systemd-stable.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)
noextract=('systemd-stable')

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
  printf '%s' "${_ver}.${_subver}.r${_rev}.d${_date}.${_hash}"
}

prepare() {
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  cmake "${srcdir}/${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_LIBSYSTEMD=ON \
    -DBUILD_CODE_GEN=ON \
    -DBUILD_DOC=ON \
    -DBUILD_DOXYGEN_DOC=ON

  msg2 "Copying libsystemd source files into place ..."
  _libsystemd_version="$(grep -E '^[[:space:]]*LIBSYSTEMD_VERSION(:[a-zA-Z]*|)[[:space:]]*=.+' CMakeCache.txt | tail -n 1 | awk -F'=' '{print $2}')"
  mkdir -p "${srcdir}/build/libsystemd-v${_libsystemd_version}/src/LibsystemdBuildProject"

  pushd "${srcdir}/systemd-stable" > /dev/null
  GIT_WORK_TREE="${srcdir}/build/libsystemd-v${_libsystemd_version}/src/LibsystemdBuildProject" git checkout "v${_libsystemd_version}-stable" -f
  popd > /dev/null

  git submodule update --recursive --init

  make
  make doc
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "${srcdir}/${_pkgname}/COPYING-LGPL-Exception" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-LGPL-Exception"
}

