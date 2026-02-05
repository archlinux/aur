# Maintainer: George Sofianos <george at sofianos dot dev>
# Contributor Michele Balistreri <michele at bitgamma dot com>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v9.3.0
pkgname=lemonade-server
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (Server)"
pkgver=9.3.0
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
secrets.conf
sysusers.conf
tmpfiles.conf
)

sha256sums=(  
'c6aee123bc4f5ca153bf3ab31db4f60c7471987cc94ac0c92242e36c1357e5c7'
'2818b183757e29dd52b47a185f0cea9ef2d0fba377d8710b450a26328e51c2fe'
'464336783e25081a04af8d204759ad617243724796da5b9f601ca83570c60fb2'
'069d5612d570e83128d7eed7ffe4525943d75d22b9c84537d861833157e74b26'
'6fbbdf843a4c74811e304d666b99b887c1b5bf94d04d924cf5c2136c0b3cc691'
)

build() {
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
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  sed -i "10i EnvironmentFile=/etc/lemonade/secrets.conf" ${pkgdir}/usr/lib/systemd/system/lemonade-server.service
  install -dm0755 "${pkgdir}"/var/lib/lemonade
  install -dm0755 "${pkgdir}"/etc/lemonade

  install -vDm660 secrets.conf "${pkgdir}/etc/lemonade/secrets.conf"
  install -vDm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
