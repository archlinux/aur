# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-chrome
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="A special compilation of curl that makes it impersonate Chrome"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=(tar gcc cmake go ninja unzip zlib autoconf automake libtool patch)
depends=(nss libc++)
provides=(libcurl-impersonate-chrome)
conflicts=(curl-impersonate-bin)

source=(
  "curl-impersonate-${pkgver}.tar.gz::https://github.com/lexiforest/curl-impersonate/archive/refs/tags/v${pkgver}.tar.gz"
)

md5sums=('c59864c8526b70233417658e1ded1e77')

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
  # Only keep curl-impersonate* and curl_chrome*
  find -L "${pkgdir}/usr/bin" -type f ! -iname "curl-impersonate*" ! -iname "curl_chrome*" -print0 | xargs -0r -I@ -- rm -vf "@"

  # Cleanup libcurl
  find -L "${pkgdir}/usr/lib" -type f ! -iname "lib*.so*" -print0 | xargs -0r -I@ -- rm -vf "@"
  chown -R root:root "${pkgdir}/usr/lib/"
}
