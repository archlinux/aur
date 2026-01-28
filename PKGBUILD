# Maintainer: trya <tryagainprod@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>
# Contributor: Stalwart <stlwrt@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>

pkgname=generator
pkgver=0.35_cbiere_r4
_realver=0.35-cbiere-r4
pkgrel=8
pkgdesc="A Sega Megadrive/Genesis emulator"
arch=('i686' 'x86_64')
url="http://www.squish.net/generator"
license=("GPL")
depends=('gtk' 'sdl' 'bzip2' 'zlib' 'libjpeg')
makedepends=('nasm')
source=("http://www.squish.net/generator/cbiere/generator/generator-0.35-cbiere-r4.tar.bz2")
md5sums=('db4142912872a3f34d6d4e3bfe693b64')
options=(!makeflags)

prepare() {
  cd "$srcdir/$pkgname-$_realver"
  sed -e 's/INLINE/static INLINE/' \
      -i ym2612/fm.c
  sed -e 's/inline/static inline/' \
      -i main/vdp.c
  sed -e 's/CONTEXTMZ80 cpuz80_z80/extern CONTEXTMZ80 cpuz80_z80/' \
      -i hdr/cpuz80.h
  sed -e 's/gzFile \*gzf/gzFile gzf/' -e 's/RETSIGTYPE gen_sighandler/void gen_sighandler/' \
      -i main/generator.c
  sed -e '12i #include <sys/time.h>' \
      -i main/ui-gtk.c
}

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
