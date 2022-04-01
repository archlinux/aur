# Maintainer: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=1.47.0
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library'
arch=(x86_64)
url='https://nghttp2.org/'
license=(MIT)
depends=(openssl libev zlib libxml2 jansson jemalloc c-ares libnghttp2 systemd-libs)
makedepends=(systemd cython python-setuptools)
options=(!emptydirs)
source=(https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz)
backup=(
  etc/nghttpx/nghttpx.conf
  etc/logrotate.d/nghttpx
)
sha512sums=('ad6266a15789fec966db6be8ac0b9ee6cca257a3bb91fdd34a58acf0e472643a571941b5974d16c98f6ac5bfa6a03c4b70a6dff222fb0cd50909178b7e94ce48')

build() {
  cd nghttp2-$pkgver

  autoreconf -i
  ./configure \
    --prefix=/usr \
    --disable-examples
  make
}

check() {
  cd nghttp2-$pkgver
  make check
}

package() {
  cd nghttp2-$pkgver

  make DESTDIR="$pkgdir" install
  make -C lib DESTDIR="$pkgdir" uninstall

  install -Dm644 contrib/nghttpx.service "$pkgdir/usr/lib/systemd/system/nghttpx.service"
  install -Dm644 contrib/nghttpx-logrotate "$pkgdir/etc/logrotate.d/nghttpx"
  install -Dm644 nghttpx.conf.sample "$pkgdir/etc/nghttpx/nghttpx.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/nghttp2/COPYING"
}
