# Maintainer: Shaun Bouckaert <shaun@train-meditations.com>
# Contributor: francoism90
# Contributor: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=1.55.1
pkgrel=1
pkgdesc='Client, server and proxy programs from the nghttp2 library'
arch=(x86_64)
url='https://nghttp2.org/'
license=(MIT)
depends=(python libev libxml2 jansson jemalloc c-ares "libnghttp2>=$pkgver" systemd-libs)
options=(!emptydirs)
source=(https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz)
backup=(
  etc/nghttpx/nghttpx.conf
  etc/logrotate.d/nghttpx
)
sha256sums=('19490b7c8c2ded1cf7c3e3a54ef4304e3a7876ae2d950d60a81d0dc6053be419')

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
