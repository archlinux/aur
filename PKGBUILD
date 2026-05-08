# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

_pkgname=libstirshaken
pkgname=${_pkgname}-git
pkgver=r411.cb6ede4
pkgrel=1
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
  'gcc'
  'git'
  'libtool'
  'make'
  'pkg-config'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Patch curl_easy_setopt calls to cast parameters to (long) where needed
  sed -i -e 's/curl_easy_setopt(\(.*\), CURLOPT_PROTOCOLS, CURLPROTO_HTTPS);/curl_easy_setopt(\1, CURLOPT_PROTOCOLS, (long) CURLPROTO_HTTPS);/' \
         -e 's/curl_easy_setopt(\(.*\), CURLOPT_PROTOCOLS, CURLPROTO_HTTP);/curl_easy_setopt(\1, CURLOPT_PROTOCOLS, (long) CURLPROTO_HTTP);/' \
         -e 's/curl_easy_setopt(\(.*\), CURLOPT_PORT, \(.*\));/curl_easy_setopt(\1, CURLOPT_PORT, (long) \2);/' \
         -e 's/curl_easy_setopt(\(.*\), CURLOPT_HTTPGET, 1);/curl_easy_setopt(\1, CURLOPT_HTTPGET, (long) 1);/' \
         src/stir_shaken_service.c

  # GCC 16: avoid discarded-qualifiers warning promoted to error by upstream -Werror
  sed -i 's/char \*p = NULL;/const char *p = NULL;/' src/stir_shaken.c
  sed -i 's/char \*p = NULL;/const char *p = NULL;/' src/stir_shaken_verify.c
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./bootstrap.sh
  ./configure --prefix=/usr
  # -fcf-protection=full: Enables control-flow protection
  # -Wno-deprecated-declarations: Suppresses warnings about deprecated declarations
  # -Wno-error=discarded-qualifiers: GCC 16 trips upstream -Werror on const qualifier warnings
  make CFLAGS+=" -fcf-protection=full -Wno-deprecated-declarations -Wno-error=discarded-qualifiers"
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
