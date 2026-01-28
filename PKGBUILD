# Maintainer: George Sofianos <george at sofianos dot dev>
# Contributor Michele Balistreri <michele at bitgamma dot com>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v9.2.0
pkgname=lemonade-server
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (Server)"
pkgver=9.2.0
pkgrel=1
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
makedepends=('cmake' 'ninja' 'git' 'cli11' 'nlohmann-json' 'openssl')
depends=('zstd')
provides=('lemonade-server')
backup=('etc/lemonade/lemonade.conf')
_httplibver=0.30.1

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/refs/tags/v${pkgver}.tar.gz"
"httplib-${_httplibver}.tar.gz::https://github.com/yhirose/cpp-httplib/archive/refs/tags/v${_httplibver}.tar.gz"
lemonade-server.service
lemonade.conf
sysusers.conf
tmpfiles.conf
)

sha256sums=(  
'c5aee810d6e30e969d962b265a2e2a637769f81e9e29fd88bdc650ce76411cc3'
'2818b183757e29dd52b47a185f0cea9ef2d0fba377d8710b450a26328e51c2fe'
'ae859c2949ea0122f97ee0972f5d3a00f13106182939ef041bdfcfd65fa6d250'
'30893dd8f50716d8fb9a44aad49f26120ebeff7ddb7d72463bf351ed6aec1ab8'
'069d5612d570e83128d7eed7ffe4525943d75d22b9c84537d861833157e74b26'
'dea2b027049b7415c4a9551bc32aff04963ba3fc55fd087a13602bc50dd3a14f'
)

build() {
  local cmake_options=(
    -B build
    -G Ninja
    -S lemonade-${pkgver}/src/cpp
    -W no-dev
    -D FETCHCONTENT_FULLY_DISCONNECTED=ON
    -D FETCHCONTENT_SOURCE_DIR_HTTPLIB="${srcdir}/cpp-httplib-${_httplibver}"
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -dm0755 "${pkgdir}"/var/lib/lemonade
  install -dm0755 "${pkgdir}"/etc/lemonade

  install -vDm644 lemonade.conf "${pkgdir}/etc/lemonade/lemonade.conf"
  install -vDm644 lemonade-server.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -vDm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
