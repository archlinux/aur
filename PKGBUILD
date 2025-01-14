# Maintainer: envolution
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=lib32-sdl_sound
pkgver=2.0.4
pkgrel=2
pkgdesc="A library to decode several popular sound file formats, such as .WAV and .MP3 (32 bit)"
arch=('x86_64' 'i686')
url="http://icculus.org/SDL_sound/"
license=('Zlib')
depends=(
  lib32-sdl
  sdl_sound)
source=($pkgname-$pkgver.tar.gz::https://github.com/icculus/SDL_sound/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('6f8b324ce23382929ab90ded7fcd6e303b66cb22b4e15b4e3c3a99f500a4eec1')

build() {
  cd SDL_sound-$pkgver
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export SDL_CONFIG=/usr/bin/sdl-config-32
  cmake -DCMAKE_C_FLAGS="-m32 -L/usr/lib32" \
    -DCMAKE_CXX_FLAGS="-m32 -L/usr/lib32" \
    -DCMAKE_EXE_LINKER_FLAGS="-m32 -L/usr/lib32" \
    -DCMAKE_FIND_LIBRARY_SUFFIXES=".so" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="/usr/lib32" \
    -S ./ \
    -B ./build
  cmake --build build
}

package() {
  cd SDL_sound-$pkgver/build
  make DESTDIR="$pkgdir" install
  # remove stuff already present in sdl_sound package
  rm -rf "$pkgdir"/usr/{bin,include,lib}
}
# vim:set ts=2 sw=2 et:
