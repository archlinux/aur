# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-firefox
pkgver=1.2.1
pkgrel=1
pkgdesc="A special compilation of curl that makes it impersonate Firefox"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=(tar gcc cmake go ninja unzip zlib autoconf automake libtool patch)
depends=(nss libc++)
provides=(curl-impersonate-firefox libcurl-impersonate-firefox)

# WORKAROUND for building brotli
options=("!buildflags")

source=(
  "curl-impersonate-${pkgver}.tar.gz::https://github.com/lexiforest/curl-impersonate/archive/refs/tags/v${pkgver}.tar.gz"
)

md5sums=('5c0783bd2e9e9e1979548183209721fb')

prepare () {
  export CXXFLAGS+=" -Wno-error=stringop-overflow"
  cd curl-impersonate-${pkgver}
  autoconf
  mkdir -p build
  cd build
  ../configure --prefix="${pkgdir}/usr"
  make build -j1
}

package () {
  mkdir -p "${pkgdir}/usr"
  cd curl-impersonate-${pkgver}/build
  make install
  # Only keep curl-impersonate* and curl_firefox*
  find -L "${pkgdir}/usr/bin" -type f ! -iname "curl-impersonate*" ! -iname "curl_firefox*" -print0 | xargs -0r -I@ -- rm -vf "@"

  # Cleanup libcurl
  find -L "${pkgdir}/usr/lib" -type f ! -iname "lib*.so*" -print0 | xargs -0r -I@ -- rm -vf "@"
  chown -R root:root "${pkgdir}/usr/lib/"
}
