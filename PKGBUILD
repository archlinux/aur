# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=nghttp2-custom
pkgver=1.0.5
_pkgver=v1.0.5
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
sha256sums=('64e066816606178188bfaf0aa7298e1f44cef943dd9ae936497dab38b3b2569e')

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
