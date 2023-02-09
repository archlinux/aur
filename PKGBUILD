# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=lib32-sdl2_mixer
pkgver=2.6.3
pkgrel=1
pkgdesc='A simple multi-channel audio mixer'
arch=(x86_64)
url=https://github.com/libsdl-org/SDL_mixer
license=(MIT)
depends=(
  lib32-flac
  lib32-glibc
  lib32-libmodplug
  lib32-libvorbis
  lib32-mpg123
  lib32-sdl2
  sdl2_mixer
)
makedepends=(
  git
  lib32-fluidsynth
)
optdepends=('lib32-fluidsynth: MIDI software synth, replaces built-in timidity')
_tag=6103316427a8479e5027e41ab9948bebfc1c3c19
source=(git+https://github.com/libsdl-org/SDL_mixer.git#tag=${_tag})
b2sums=('SKIP')

prepare() {
  cd SDL_mixer
  ./autogen.sh
}

pkgver() {
  cd SDL_mixer
  git describe --tags | sed 's/^release-//'
}

build() {
  cd SDL_mixer
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static
  make
}

package() {
  make DESTDIR="${pkgdir}" -C SDL_mixer install
  rm -rf "${pkgdir}"/usr/include
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2_mixer "${pkgdir}"/usr/share/licenses/lib32-sdl2_mixer
}

# vim: ts=2 sw=2 et:
