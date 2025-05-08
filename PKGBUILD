# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate
pkgver=1.0.0rc2
pkgrel=1
epoch=1
pkgdesc="A special compilation of curl that makes it impersonate Firefox, Crome and other browsers. Includes libcurl."
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=(tar gcc14 cmake go ninja unzip zlib autoconf automake libtool patch)
depends=(nss libc++)
provides=(curl-impersonate-chrome curl-impersonate-firefox libcurl-impersonate)
conflicts=(curl-impersonate-bin curl-impersonate-chrome curl-impersonate-firefox libcurl-impersonate-bin)
replaces=(curl-impersonate-chrome curl-impersonate-firefox)

source=(
  "curl-impersonate.tar.gz::https://github.com/lexiforest/curl-impersonate/archive/refs/tags/v${pkgver}.tar.gz"
)

md5sums=('b13bc66f4081641686a80847ce05a320')

build () {
  export CXXFLAGS+=" -Wno-error=stringop-overflow"
  export CC=gcc-14 CXX=g++-14
  cd curl-impersonate-${pkgver}
  autoconf
  mkdir -p build
  cd build
  ../configure --prefix="${pkgdir}/usr"
  make build -j1
}

package () {
  # Install all curl impersonate binaries
  mkdir -p "${pkgdir}/usr"
  cd curl-impersonate-${pkgver}/build
  make install

  # Cleanup libcurl
  find -L "${pkgdir}/usr/lib" -type f ! -iname "lib*.so*" -print0 | xargs -0r -I@ -- rm -vf "@"
  chown -R root:root "${pkgdir}/usr/lib/"
}
