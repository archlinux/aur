# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=libwebp052
_pkgname=libwebp
pkgver=0.5.2
pkgrel=2
pkgdesc="WebP library and conversion tools (old version providing libwebp.so.6)"
arch=(i486 i686 pentium4 x86_64)
url="https://developers.google.com/speed/webp/"
license=(BSD)
depends=(libpng libjpeg libtiff giflib)
makedepends=(freeglut mesa glu git)
optdepends=('freeglut: vwebp viewer')
source=(http://storage.googleapis.com/downloads.webmproject.org/releases/webp/$_pkgname-$pkgver.tar.gz)
sha256sums=('b75310c810b3eda222c77f6d6c26b061240e3d9060095de44b2c1bae291ecdef')
validpgpkeys=('6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D') # WebP release signing key

prepare() {
  cd $_pkgname-$pkgver
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname-$pkgver
  ./configure \
    --prefix=/opt/$_pkgname-$pkgver \
    --disable-static \
    --enable-swap-16bit-csp \
    --enable-experimental \
    --enable-libwebp{mux,demux,decoder,extras}
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -D -d -m755 "$pkgdir"/etc/ld.so.conf.d
  cat > "$pkgdir"/etc/ld.so.conf.d/$pkgname.conf << EOF
/opt/$_pkgname-$pkgver/lib
EOF
}

# vim:set ts=2 sw=2 et:
