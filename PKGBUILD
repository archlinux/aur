# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgbasename=speex
pkgname=lib32-$_pkgbasename
pkgver=1.2.0
pkgrel=3
pkgdesc="A free codec for free speech (32-bit)"
arch=(x86_64)
url="https://speex.org/"
license=(BSD)
depends=(lib32-libogg lib32-speexdsp $_pkgbasename)
makedepends=(gcc-multilib)
source=(https://downloads.us.xiph.org/releases/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz)
sha256sums=('eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094')

build() {
  cd $_pkgbasename-$pkgver

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static \
    --libdir=/usr/lib32 \
    --enable-binaries # Must be given or configure won't use pkg-config correctly
  make
}

check() {
  cd $_pkgbasename-$pkgver
  make -k check
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
