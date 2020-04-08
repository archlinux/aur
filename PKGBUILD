# Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=vice-sdl2
_pkgname=vice
pkgver=3.4
pkgrel=1
pkgdesc='The Versatile Commodore 8-bit Emulator, SDL2 version'
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=('sdl2' 'libpulse' 'portaudio' 'mpg123' 'pciutils' 'giflib' 'libpng' 'libpcap' 'libjpeg-turbo')
makedepends=('xorg-font-utils' 'xa')
provides=('vice')
conflicts=('vice' 'vice-gtk' 'vice-sdl' 'vice-sdl-devel' 'vice-gtkglext' 'vice-gnomeui-devel')
replaces=('vice')
options=('!makeflags')
source=(
  https://sourceforge.net/projects/vice-emu/files/releases/${_pkgname}-${pkgver}.tar.gz/download
  no-fc-cache-no-lib64.patch
  ${_pkgname}.desktop
  ${_pkgname}.png
)
sha256sums=(
  4bd00c1c63d38cd1fe01b90032834b52f774bc29e4b67eeb1e525b14fee07aeb
  7f3137b122a6c71dfe8dafbc2be498409436f15792baec9751b13c1507144cad
  e0a600d72c2352826282a0f7fcf380b24272fba10a9ed31c8fd45a21d597f3ad
  0d51f822b70d24bbc9d813d552138660cf705aaaecc12115bc1416364e1473b3
)

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -Np1 -i ../no-fc-cache-no-lib64.patch
  autoreconf -f -i
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-sdlui2 --with-sdlsound --enable-ethernet --enable-x64
  make
}

package() {
  install -Dm644 ${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${_pkgname}.png $pkgdir/usr/share/pixmaps/${_pkgname}.png
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
