# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=nghttp2-custom
pkgver=1.1.2
_pkgver=v1.1.2
_pkgname=${pkgname/-custom/}
pkgrel=1
pkgdesc="HTTP/2 C Library (with python binding, sample server implementation and other utils)"
arch=('i686' 'x86_64')
url="https://nghttp2.org/"
license=('MIT')
depends=('libev' 'spdylay>=1.3.2' 'cython' 'jemalloc' 'python2' 'jansson' 'boost')
provides=('nghttp2')
conflicts=('nghttp2' 'nghttp2-git')
source=("https://github.com/tatsuhiro-t/nghttp2/releases/download/${_pkgver}/nghttp2-${pkgver}.tar.gz")
backup=('etc/nghttpx/nghttpx.conf')
sha256sums=('81899b9a240b11bf4f83108cd4f278c2bf21151aff447a59ce97224b2e2518aa')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
   --enable-app \
   --enable-hpack-tools \
   --enable-examples \
   --enable-python-bindings \
   --enable-asio-lib \
   --with-jemalloc \
   --with-spdylay \
   --with-cython=/usr/bin/cython \
   --with-boost=yes \

  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 nghttpx.conf.sample "$pkgdir/etc/nghttpx/nghttpx.conf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/nghttp2/COPYING"
  
  find ./examples/.libs -type f -executable -exec install -m755 {\} "$pkgdir/usr/bin/" \;
  
  cd python
  python2 setup.py install --root="$pkgdir" --optimize=1
}
