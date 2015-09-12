# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=nghttp2
pkgver=1.3.1
_pkgver=v1.3.1
pkgrel=1
pkgdesc="HTTP/2 C Library"
arch=('i686' 'x86_64')
url="https://nghttp2.org/"
license=('MIT')
depends=('openssl' 'libev' 'zlib' 'spdylay' 'libxml2' 'jansson' 'jemalloc')
source=("https://github.com/tatsuhiro-t/nghttp2/releases/download/${_pkgver}/nghttp2-${pkgver}.tar.gz")
backup=('etc/nghttpx/nghttpx.conf'
        'etc/logrotate.d/nghttpx')
sha256sums=('0e79920d4fa9706ed0fd46386664b4170bae34b5c9c74ee2eddb99cdf980d852')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --disable-examples \
    --disable-python-bindings
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 contrib/nghttpx.service "$pkgdir/usr/lib/systemd/system/nghttpx.service"
  install -Dm644 contrib/nghttpx-logrotate "$pkgdir/etc/logrotate.d/nghttpx"
  install -Dm644 nghttpx.conf.sample "$pkgdir/etc/nghttpx/nghttpx.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/nghttp2/COPYING"
}
