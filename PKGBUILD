# Maintainer: George Sofianos <george at sofianos dot dev>
# Contributor Michele Balistreri <michele at bitgamma dot com>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v9.4.1
pkgname=lemonade-server
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (Server)"
pkgver=9.4.1
pkgrel=1
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
makedepends=('cmake' 'ninja' 'git' 'cli11' 'nlohmann-json' 'openssl')
depends=('zstd')
provides=('lemonade-server')
backup=('etc/lemonade/lemonade.conf' 'etc/lemonade/secrets.conf')
_httplibver=0.34.0
_ixwebsocketver=11.4.6
_cores=8

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/refs/tags/v${pkgver}.tar.gz"
"httplib-${_httplibver}.tar.gz::https://github.com/yhirose/cpp-httplib/archive/refs/tags/v${_httplibver}.tar.gz"
"ixwebsocket-${_ixwebsocketver}.tar.gz::https://github.com/machinezone/IXWebSocket/archive/refs/tags/v${_ixwebsocketver}.tar.gz"
sysusers.conf
tmpfiles.conf
)

sha256sums=(  
'da22036a40cd0272e5b85632e7f94d3d168c7618cf3df7f151b4237486c10c75'
'cb8e41c4b270f4fc520df71097089b71896c652927d61a94a11cd59689a0515b'
'c024334f8e45980836c67008979a884d6dcc5ef067dd2eb1fa7241f4c17ddc32'
'069d5612d570e83128d7eed7ffe4525943d75d22b9c84537d861833157e74b26'
'6fbbdf843a4c74811e304d666b99b887c1b5bf94d04d924cf5c2136c0b3cc691'
)

build() {
  # limit ninja memory consumption
  if (( $(nproc) < 8 )) then
    _cores=$(nproc)
  fi

  echo "Building with ${_cores} cores"

  local cmake_options=(
    -B build
    -G Ninja
    -S lemonade-${pkgver}
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

  install -vDm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
