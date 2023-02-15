# Maintainer: Shaun Bouckaert <shaun@train-meditations.com>
# Contributor: francoism90
# Contributor: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=1.52.0
pkgrel=2
pkgdesc='Client, server and proxy programs from the nghttp2 library'
arch=(x86_64)
url='https://nghttp2.org/'
license=(MIT)
depends=(python libev libxml2 jansson jemalloc c-ares "libnghttp2=$pkgver" systemd-libs)
options=(!emptydirs)
source=(https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz)
backup=(
  etc/nghttpx/nghttpx.conf
  etc/logrotate.d/nghttpx
)
sha512sums=('3af1ce13270f7afc8652bd3de71200d9632204617fe04d2be7156d60eeb1a5cc415573677791a399ae03577e8e3256939b1b05d27dbd98dee504d09ec5325d56')

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
