# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgbasename=speex
pkgname=lib32-$_pkgbasename
pkgver=1.2rc2
pkgrel=1
pkgdesc="A free codec for free speech (32-bit)"
arch=(x86_64)
url="http://www.speex.org/"
license=('BSD')
depends=('lib32-libogg' 'lib32-speexdsp' $_pkgbasename)
makedepends=(gcc-multilib)
source=(http://downloads.us.xiph.org/releases/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz)
md5sums=('6ae7db3bab01e1d4b86bacfa8ca33e81')

build() {
  cd $_pkgbasename-$pkgver

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
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
