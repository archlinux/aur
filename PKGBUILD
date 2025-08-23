# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate
pkgver=1.2.1
pkgrel=2
epoch=1
pkgdesc="A special compilation of curl that makes it impersonate Firefox, Crome and other browsers. Includes libcurl."
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=(tar cmake go ninja unzip zlib autoconf automake libtool patch)
makedepends_x86_64=(gcc14)
depends=(nss libc++ zstd libidn2 rtmpdump)
provides=(curl-impersonate-chrome curl-impersonate-firefox libcurl-impersonate libcurl-impersonate-chrome libcurl-impersonate-firefox)
conflicts=(curl-impersonate-bin curl-impersonate-chrome curl-impersonate-firefox libcurl-impersonate-bin)
replaces=(curl-impersonate-chrome curl-impersonate-firefox)

source=(
  "curl-impersonate-${pkgver}.tar.gz::https://github.com/lexiforest/curl-impersonate/archive/refs/tags/v${pkgver}.tar.gz"
)

md5sums=('5c0783bd2e9e9e1979548183209721fb')

prepare () {
  export CXXFLAGS+=" -Wno-error=stringop-overflow -std=c++17"
  if [[ $CARCH != "aarch64" ]]; then
    export CC=gcc-14 CXX=g++-14
  fi
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

  # Link libcurl
  ln -s /usr/lib/libcurl-impersonate.so.4.8.0 "$pkgdir"/usr/lib/libcurl-impersonate-chrome.so
  ln -s /usr/lib/libcurl-impersonate.so.4.8.0 "$pkgdir"/usr/lib/libcurl-impersonate-chrome.so.4

  rm "$pkgdir"/usr/bin/wcurl

  cd ../
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
