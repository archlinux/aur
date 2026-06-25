# Maintainer: George Sofianos <george at sofianos dot dev>
# Contributor: Michele Balistreri <michele at bitgamma dot com>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v10.8.1
pkgname=lemonade-server
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (Server)"
pkgver=10.8.1
pkgrel=1
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
makedepends=('cmake' 'ninja' 'git' 'cli11' 'nlohmann-json' 'libdrm' 'nodejs' 'npm')
depends=('zstd' 'unzip' 'curl' 'mbedtls' 'libwebsockets')
provides=('lemonade-server')
backup=('etc/lemonade/conf.d/zz-secrets.conf')
_httplibver=0.48.0
_cores=8

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/refs/tags/v${pkgver}.tar.gz"
"httplib-${_httplibver}.tar.gz::https://github.com/yhirose/cpp-httplib/archive/refs/tags/v${_httplibver}.tar.gz"
tmpfiles.conf
)

sha256sums=(  
'd8a65148c470c104e045ce3c841d8574a8d0dc01c6a1b875deb7b8eac603dbea'
'd9ed142d319c6e19a961f477257e67f846909ce15288502188df2281941be84e'
'757132b8ebf0847798765b911a4226100e102ac32531cdcf91dbc9436e52a011'
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
  sed -i 's/^StateDirectoryMode=0750$/StateDirectoryMode=0755/' "${pkgdir}"/usr/lib/systemd/system/lemond.service
  sed -i 's/^u/u!/' "${pkgdir}"/usr/lib/sysusers.d/lemonade.conf
  install -vDm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
