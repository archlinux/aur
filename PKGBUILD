# Maintainer: francoism90
# Contributor: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=1.49.0
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
sha512sums=('599bc8e52bbe7f5bdfbf493ea2199c4c4bdeb9eac174d4c56b11fb321b11b86e82674bd3c7f60d7ea975ef60eec3f258b5438d1157491cfa23a1b9adccd7948a')

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
