# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.3.1
pkgrel=2
pkgdesc='A real-time software synthesizer based on the SoundFont 2 specifications'
arch=(x86_64)
url="https://www.fluidsynth.org/"
license=(LGPL2.1)
depends=(
  fluidsynth=${pkgver}
  lib32-glibc
  lib32-libpulse
  lib32-readline
  lib32-sdl2
)
makedepends=(
  cmake
  lib32-alsa-lib
  lib32-dbus
  lib32-glib2
  lib32-jack
  lib32-ladspa
  lib32-libinstpatch
  lib32-libpipewire
  lib32-libsndfile
  lib32-portaudio
)
source=($pkgname-$pkgver.tar.gz::https://github.com/$_name/$_name/archive/v$pkgver.tar.gz)
sha512sums=('1633294bf6c714361c381151b62d9dd2c8f388490153e7964bfa14fd647a681db9ebfe1de0a06279972d6c5b30377f67361feb4db186b1faa235600f0ae02b22')
b2sums=('a1501303e02b3ea64d87be5cff08d5f2f2be170b38faedc8e6bc4fd18c0dafe268fa6110708664ef0659df9f0e9680551ac483d30364977e768af60dfdff7e83')

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib32
    -DCMAKE_BUILD_TYPE=None
    -DFLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth
    -Denable-ladspa=ON
    -Denable-portaudio=ON
    -Wno-dev
    -B build
    -S $_name-$pkgver
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  make -C build -k check
}

package() {
  depends+=(
    lib32-alsa-lib libasound.so
    lib32-glib2 libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so
    lib32-jack libjack.so
    lib32-libinstpatch libinstpatch-1.0.so
    lib32-libpipewire libpipewire-0.3.so
    lib32-libsndfile libsndfile.so
    lib32-portaudio libportaudio.so
  )

  DESTDIR="$pkgdir" cmake --install build
  rm -rf "$pkgdir"/usr/{include,share,bin}
}
# vim: ts=2 sw=2 et:
