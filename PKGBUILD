# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=curl-cmake
pkgver=8.22.0
pkgrel=1
arch=('any')
pkgdesc="curl configuration files for CMake"
url="https://github.com/curl/curl"
license=('curl')
depends=('cmake' 'curl')
_curl_release="curl-curl-${pkgver//\./_}"
source=("$_curl_release.tar.gz::$url/archive/refs/tags/${_curl_release#*-}.tar.gz")
b2sums=('d01692a64f41e6f5a5218908507e98782b46ef2076a886a05199add04d1f9c805b3074d5dc8225af82c9000c8592462acb3e9d10bca05c04f9ac2b5aeeb9411c')

build() {
  cmake $_curl_release \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build/
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  for files in \
    'bin' \
    'include' \
    'lib/libcurl*' \
    'lib/pkgconfig' \
    'share/man'
  do
    rm -fr $pkgdir/usr/$files
  done

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$_curl_release/COPYING" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}
