# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgbasename=sdl
pkgname=lib32-$_pkgbasename-nobackingstore
pkgver=1.2.15
pkgrel=4
pkgdesc="sdl library that does not use backing store by default (prevent tearing due to a bug in Xserver)"
arch=('x86_64')
url="http://www.libsdl.org"
license=('LGPL')
depends=('lib32-libxext' 'lib32-libxrender' 'lib32-libx11' $_pkgbasename)
makedepends=('lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse' gcc-multilib)
optdepends=('lib32-alsa-lib: ALSA audio driver'
            'lib32-libpulse: PulseAudio audio driver')
provides=("lib32-sdl=$pkgver")
replaces=('lib32-sdl')
conflicts=('lib32-sdl')
options=('!libtool')
install="message.install"
source=(http://www.libsdl.org/release/SDL-${pkgver}.tar.gz
        sdl-1.2.14-fix-mouse-clicking.patch
        sdl-1.2.14-disable-mmx.patch
        fix_joystick_misc_axes.diff
        backingstore_on_demand.diff
        libsdl-1.2.15-resizing.patch
		X11_KeyToUnicode.patch)

md5sums=('9d96df8417572a2afb781a7c4c811a85'
         '04d8c179f125e04bcd4c9d60e013c2d7'
         'e5c16b7611f62c7cb25f0534eff68852'
         '687586a108b597a2a6b73070c1d37e51'
         '5f81abefba5713c2ebfc21b2a1e6e044'
         '3dd50347d8856160a9cbd7f80383a1f8'
         'edea272dff4698470877c016d818918d')
build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd SDL-$pkgver
  patch -Np1 -i ../sdl-1.2.14-fix-mouse-clicking.patch
  patch -Np1 -i ../sdl-1.2.14-disable-mmx.patch
  patch -Np1 -i ../backingstore_on_demand.diff
  patch -Np1 -i ../fix_joystick_misc_axes.diff
  patch -Np1 -i ../libsdl-1.2.15-resizing.patch
  patch -Np1 -i ../X11_KeyToUnicode.patch
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd SDL-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/{include,share}

  cd "$pkgdir/usr/bin"
  mv sdl-config sdl-config-32
}
