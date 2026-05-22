# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>

_pkgbase='nsproxy'
pkgname="${_pkgbase}-git"
pkgver=0.5.2
pkgrel=1
pkgdesc='A tool to force applications to use a specific SOCKS5 or HTTP proxy (git version to track dev branch)'
url="https://github.com/nlzy/${_pkgbase}"
license=('GPL-2.0-or-later')
source=("git+${url}.git#branch=dev")
sha256sums=('SKIP')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('cmake' 'linux-api-headers' 'git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}=${pkgver}")

pkgver() {
  local _pkgver=$(git --git-dir "${_pkgbase}/.git" describe)
  _pkgver="${_pkgver//-/.}"
  printf '%s' "${_pkgver#v}"
}

build() {
  export CFLAGS=$(echo "${CFLAGS}" | sed 's/ -Wp,-D_FORTIFY_SOURCE=[^ ]\+ / /')
  export CXXFLAGS=$(echo "${CXXFLAGS}" | sed 's/ -Wp,-D_FORTIFY_SOURCE=[^ ]\+ / /')
  cmake -B build -S "${_pkgbase}" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  cmake --build build
}

package() {
  cmake --install build
}
