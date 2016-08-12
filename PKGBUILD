# Maintainer: Jitang Zheng <jitang.zheng@gmail.com>

pkgname=nghttp2-git
pkgver=1.13.0.r43.g8df2c35
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library'
arch=(i686 x86_64)
url='https://github.com/nghttp2/nghttp2'
license=(MIT)
conflicts=(nghttp2)
provides=(nghttp2)
replaces=(nghttp2)
depends=(openssl libev zlib libxml2 jansson jemalloc boost boost-libs)
makedepends=(git cmake)
source=(git+https://github.com/nghttp2/nghttp2.git)
backup=(
  etc/nghttpx/nghttpx.conf
  etc/logrotate.d/nghttpx
)
md5sums=(SKIP)

pkgver() {
  cd nghttp2
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd nghttp2

  autoreconf -i
  ./configure \
    --prefix=/usr \
    --with-spdylay=no \
    --disable-examples \
    --disable-python-bindings \
    --enable-asio-lib
  make 
}

check() {
  cd nghttp2
  make check
}

package() {
  cd nghttp2

  make DESTDIR="$pkgdir" install
  install -Dm644 contrib/nghttpx.service "$pkgdir/usr/lib/systemd/system/nghttpx.service"
  install -Dm644 contrib/nghttpx-logrotate "$pkgdir/etc/logrotate.d/nghttpx"
  install -Dm644 nghttpx.conf.sample "$pkgdir/etc/nghttpx/nghttpx.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/nghttp2/COPYING"
}
