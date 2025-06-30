# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=libstirshaken
pkgver=1.0.0
pkgrel=2
pkgdesc="STIR-Shaken authentication and verification library"
arch=('x86_64')
url="https://github.com/signalwire/libstirshaken"
license=('MIT')
depends=(
  'curl'
  'glibc'
  'libjwt2'
  'libks2'
  'openssl'
)
makedepends=(
  'autoconf'
  'automake'
  'cmake'
  'gcc'
  'gdb'
  'git'
  'libtool'
  'make'
  'pkg-config'
)
source=("git+${url}.git#commit=cb6ede40b3ce12ab76e370186a14dc141839ef07")
sha256sums=('3b4eece0fbfa91c050b825d17053935013e7e72f83503829dd05d7a507793346')

prepare() {
  cd "${srcdir}/${pkgname}"

  # Patch curl_easy_setopt calls to cast parameters to (long) where needed
  sed -i -e 's/curl_easy_setopt(\(.*\), CURLOPT_PROTOCOLS, CURLPROTO_HTTPS);/curl_easy_setopt(\1, CURLOPT_PROTOCOLS, (long) CURLPROTO_HTTPS);/' \
         -e 's/curl_easy_setopt(\(.*\), CURLOPT_PROTOCOLS, CURLPROTO_HTTP);/curl_easy_setopt(\1, CURLOPT_PROTOCOLS, (long) CURLPROTO_HTTP);/' \
         -e 's/curl_easy_setopt(\(.*\), CURLOPT_PORT, \(.*\));/curl_easy_setopt(\1, CURLOPT_PORT, (long) \2);/' \
         -e 's/curl_easy_setopt(\(.*\), CURLOPT_HTTPGET, 1);/curl_easy_setopt(\1, CURLOPT_HTTPGET, (long) 1);/' \
         src/stir_shaken_service.c
}

build() {
  cd "${srcdir}/${pkgname}"

  ./bootstrap.sh
  ./configure --prefix=/usr
  # -fcf-protection=full: Enables control-flow protection
  # -Wno-deprecated-declarations: Suppresses warnings about deprecated declarations
  make CFLAGS+=" -fcf-protection=full -Wno-deprecated-declarations"
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
