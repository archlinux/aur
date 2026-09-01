# Maintainer: Shaun Bouckaert <shaun@train-meditations.com>
# Contributor: francoism90
# Contributor: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=1.70.0
pkgrel=2
pkgdesc='Client, server and proxy programs from the nghttp2 library'
arch=(x86_64)
url='https://nghttp2.org/'
license=(MIT)
depends=('openssl>=1.1.1' 'libev>=4.11' 'zlib>=1.2.3' 'c-ares>=1.7.5' 'libxml2>=2.6.26' 'systemd-libs>=209' 'jansson>=2.5' 'jemalloc' "libnghttp2>=$pkgver")
options=(!emptydirs)
source=("https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz")
backup=(
  etc/nghttpx/nghttpx.conf
  etc/logrotate.d/nghttpx
)
sha256sums=('e05cb1388eaca3830aded4ccf20044b6e1ac1a61411dcca11b0437c4285c8bc2')

build() {
  cd nghttp2-$pkgver

  autoreconf -i
  ./configure \
    --prefix=/usr \
    --with-openssl \
    --disable-examples \
    --enable-app
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
