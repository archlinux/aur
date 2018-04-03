# Maintainer: Darshit Shah [ darnir [uses] gnu [tld] org ]
# Contributor: Anatol Pomozov
# Contributor: Zhuoyun Wei <wzyboy@wzyboy.org>

_pkgname=libnghttp2
pkgname=${_pkgname}-git
pkgver=1.31.0.r12.gb48bcb21
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library'
arch=(x86_64)
url='https://nghttp2.org/'
license=(MIT)
depends=(glibc)
makedepends=('git' 'cmake')
conflicts=('nghttp2<1.20.0-2' 'libnghttp2')
provides=('libnghttp2')
source=(git+https://github.com/nghttp2/nghttp2.git)
sha256sums=('SKIP')

pkgver() {
  cd nghttp2
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd nghttp2

  autoreconf -i
  ./configure \
    --prefix=/usr \
    --disable-examples \
    --disable-python-bindings \
    --enable-lib-only
  make
}

check() {
  cd nghttp2
  make check
}

package() {
  cd nghttp2/lib

  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/libnghttp2/COPYING"
}

