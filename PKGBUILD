# Maintainer: Arzet Ro <arzeth0@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Jesin <Jesin00@gmail.com>

_pkgbasename=libb2
pkgname=lib32-libb2
pkgver=0.98.1
pkgrel=4
arch=(x86_64)
pkgdesc='C library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp hash functions'
url='https://blake2.net/'
license=(CC0-1.0)
depends=(lib32-gcc-libs
         lib32-glibc libb2)
makedepends=(git)
source=(git+https://github.com/BLAKE2/libb2#tag=v$pkgver)
sha256sums=('eb6b596bc30918427d1e792914f454c1d3e61fef3d4499f6605ede78f835cc1b')

# libb2's build system discards the $CFLAGS variable.
# We can get around this by putting those flags in $CC.
export CC="gcc -m32 $CFLAGS"

prepare() {
  cd "$_pkgbasename"
  autoreconf -vi
}

build() {
  export ASMFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$_pkgbasename"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static \
    --enable-shared \
    --disable-native \
    --enable-fat
  make
}

check() {
  cd "$_pkgbasename"
  make check
}

package() {
  cd "$_pkgbasename"
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
