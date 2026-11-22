# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Ben Poest <ben@poest.com>
# Contributor: Jolly_Roberts
# Contributor: dreieck
# Contributor: Cirk2

_pkgname=libcpufeatures
pkgname="${_pkgname}-git"
pkgver=0.11.0+14.r470.d20261020.4814778
pkgrel=1
pkgdesc="A cross-platform C library to retrieve CPU features (such as available instructions) at runtime. By google."
url="https://github.com/google/cpu_features"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('glibc')
makedepends=('cmake' 'git' 'gtest')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed 's|^v||' | awk -F'-' '{print $1}')"
  _subver="$(git describe --tags | awk -F'-' '{print $2}')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --no-show-signature --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  if [ -z ${_ver} ]; then
    error "Error in ${FUNCNAME[0]}: Version information could not determined."
    return 1
  fi
  printf '%s' "${_ver}+${_subver}.r${_rev}.d${_date}.${_hash}"
}

prepare() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  cmake "${srcdir}/${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF
}

build() {
  cd "${srcdir}/build"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

