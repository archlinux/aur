# Maintainer: crashdummy
# Shamelessly stolen from the aur package of luciddream
# https://aur.archlinux.org/packages/lemonade-server

pkgname=lemonade-server-git
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (Server)"
epoch=1
pkgver=r1354.0915b859
pkgrel=1
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
makedepends=('cmake' 'ninja' 'git' 'cli11' 'nlohmann-json' 'openssl')
depends=('zstd' 'curl' 'libwebsockets')
provides=('lemonade-server')
conflicts=('lemonade-server')
backup=('etc/lemonade/lemonade.conf' 'etc/lemonade/secrets.conf')

_commit=0915b859681e099f5aaa95a51528e15831e34998
_httplibver=0.37.1

source=(
  "lemonade-${_commit}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/${_commit}.tar.gz"
  "httplib-${_httplibver}.tar.gz::https://github.com/yhirose/cpp-httplib/archive/refs/tags/v${_httplibver}.tar.gz"
  sysusers.conf
  tmpfiles.conf
)

sha256sums=(
  'b2e5574ba8a531f261143f278fa08e48f9f788c11e1a28cb375022429d9303f0'
  '294776b99d51860881210624b187b64bae7c451c615ea0c6befb8d9d24a139a0'
  '069d5612d570e83128d7eed7ffe4525943d75d22b9c84537d861833157e74b26'
  'f7353d20f265fbdda9121e8587443cef95ba5fb89e1704a87920876ce966804b'
)

build() {
  local _cores=8
  if (( $(nproc) < 8 )); then
    _cores=$(nproc)
  fi

  echo "Building with ${_cores} cores"

  local cmake_options=(
    -B build
    -G Ninja
    -S "lemonade-${_commit}"
    -W no-dev
    -D FETCHCONTENT_FULLY_DISCONNECTED=ON
    -D FETCHCONTENT_SOURCE_DIR_HTTPLIB="${srcdir}/cpp-httplib-${_httplibver}"
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build --parallel ${_cores}
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -dm0755 "${pkgdir}"/var/lib/lemonade
  install -dm0755 "${pkgdir}"/etc/lemonade

  install -vDm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/lemonade-server.conf"
  install -vDm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/lemonade-server.conf"
}
