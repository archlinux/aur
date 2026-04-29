# Maintainer: George Sofianos <george at sofianos dot dev>
# Contributor: Michele Balistreri <michele at bitgamma dot com>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v10.2.0
pkgname=lemonade-server
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (Server)"
pkgver=10.3.0
pkgrel=1
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
makedepends=('cmake' 'ninja' 'git' 'cli11' 'nlohmann-json' 'openssl' 'libdrm' 'nodejs' 'npm')
depends=('zstd' 'unzip' 'libwebsockets')
provides=('lemonade-server')
backup=('etc/lemonade/conf.d/zz-secrets.conf')
_httplibver=0.41.0
_cores=8

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/refs/tags/v${pkgver}.tar.gz"
"httplib-${_httplibver}.tar.gz::https://github.com/yhirose/cpp-httplib/archive/refs/tags/v${_httplibver}.tar.gz"
sysusers.conf
tmpfiles.conf
)

sha256sums=(  
'0dec99be993ed4b38678fd2fde22d45fd43dc3aa3ed6711b5275749d9fd4941d'
'6d38a6b74ea33ac3133b8352f2b55b557c1d42f36e1ed0c01f852e3218329d39'
'069d5612d570e83128d7eed7ffe4525943d75d22b9c84537d861833157e74b26'
'2904a5cbdad2ef810f5f0509ad709303541e403a3a52e3d75f1736ed7fbdf69f'
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
