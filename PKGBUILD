# Maintainer: crashdummy
# Shamelessly stolen from the aur package of luciddream
# https://aur.archlinux.org/packages/lemonade-server

pkgname=lemonade-server-git
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (Server)"
epoch=1
pkgver=r779.c8d1d2b9
pkgrel=1
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
makedepends=('cmake' 'ninja' 'git' 'cli11' 'nlohmann-json' 'openssl')
depends=('zstd' 'curl')
provides=('lemonade-server')
conflicts=('lemonade-server')
backup=('etc/lemonade/lemonade.conf' 'etc/lemonade/secrets.conf')

_commit=c8d1d2b93a663921befaa226d36e575fffe8c7e1
_httplibver=0.34.0
_ixwebsocketver=11.4.6

source=(
  "lemonade-${_commit}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/${_commit}.tar.gz"
  "httplib-${_httplibver}.tar.gz::https://github.com/yhirose/cpp-httplib/archive/refs/tags/v${_httplibver}.tar.gz"
  "ixwebsocket-${_ixwebsocketver}.tar.gz::https://github.com/machinezone/IXWebSocket/archive/refs/tags/v${_ixwebsocketver}.tar.gz"
  sysusers.conf
  tmpfiles.conf
)

sha256sums=(
  'cc238b83d23d7b8f4d419f451eacb9c67214eecefbedbf6bafe9f208d687c319'
  'cb8e41c4b270f4fc520df71097089b71896c652927d61a94a11cd59689a0515b'
  'c024334f8e45980836c67008979a884d6dcc5ef067dd2eb1fa7241f4c17ddc32'
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
    -D FETCHCONTENT_SOURCE_DIR_IXWEBSOCKET="${srcdir}/IXWebSocket-${_ixwebsocketver}"
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
