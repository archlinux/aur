# Maintainer: trya <tryagainprod@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>
# Contributor: Stalwart <stlwrt@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>

pkgname=generator
pkgver=0.35_cbiere_r4
_realver=0.35-cbiere-r4
pkgrel=5
pkgdesc="A Sega Megadrive/Genesis emulator"
arch=('i686' 'x86_64')
url="http://www.squish.net/generator"
license=("GPL")
depends=('gtk' 'sdl' 'bzip2' 'zlib' 'libjpeg')
makedepends=('nasm')
source=("http://www.squish.net/generator/cbiere/generator/generator-0.35-cbiere-r4.tar.bz2")
md5sums=('db4142912872a3f34d6d4e3bfe693b64')
options=(!makeflags)

build() {
  cd "$srcdir/$pkgname-$_realver"
  if [ "$CARCH" = "x86_64" ]; then
    # raze is a 32-bit-only emulator, must use a 64-bit compatible implementation
    ./configure --prefix=/usr --with-cmz80 --with-sdl-audio --with-gtk
  else
    # raze global macro causes an infinite recursion with recent nasm versions
    sed -e '13d' -i raze/raze.asm.in
    ./configure --prefix=/usr --with-raze --with-sdl-audio --with-gtk
  fi
  make
}

package() {
  cd "$srcdir/$pkgname-$_realver"
  make DESTDIR="$pkgdir" install
}
