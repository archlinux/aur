# Maintainer: Andy Alt <arch_stanton5995 at proton.me>

pkgname=deucessh-git
_pkgname=deucessh
pkgver=1.0.0.r532.79c3bc8
pkgrel=2
pkgdesc="SSH client and server library (development version)"
arch=('x86_64')
url="https://github.com/RealDeuce/DeuceSSH"
license=('BSD-2-Clause')
depends=('openssl')
makedepends=(
  'cmake'
  'git'
)
provides=(
  "${_pkgname}"
  'libdeucessh.so'
)
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  local _ver
  _ver=$(sed -n 's/^project(deucessh VERSION \([0-9.]*\).*/\1/p' CMakeLists.txt)
  printf "%s.r%s.%s" "${_ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DDEUCESSH_CRYPTO_BACKEND=OpenSSL
    -DDEUCESSH_BUILD_STATIC=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # Upstream installs the license under the bare project name
  mv "${pkgdir}/usr/share/licenses/${_pkgname}" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 "${_pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/examples" \
    "${_pkgname}"/examples/*
}
