# Maintainer: Gijs Vermeulen <gijsvrm@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=${pkgname#lib32-}
pkgver=2.6.0
pkgrel=2
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications (32-bit)"
arch=(x86_64)
url="https://www.fluidsynth.org/"
_url="https://github.com/fluidsynth/fluidsynth"
license=(LGPL-2.1-or-later)
depends=(
  fluidsynth=$pkgver
  lib32-gcc-libs
  lib32-glibc
  lib32-sdl3
)
makedepends=(
  cmake
  lib32-alsa-lib
  lib32-dbus
  lib32-jack
  lib32-ladspa
  lib32-libpipewire
  lib32-libpulse
  lib32-libsndfile
  lib32-portaudio
  lib32-readline
  lib32-systemd
)
provides=(
  libfluidsynth.so
)
source=(
  $_name-$pkgver.tar.gz::$_url/archive/v$pkgver.tar.gz
)
sha512sums=('4826ae47011f6de2101559faa24db48ee93b7435086d71854278087da59b573aceba929ea3abaa105fd38fb83a218ee91a0542cb7526a33cb06c5c3cdb32a496')
b2sums=('9882ce9a3e72acb4f4eb9652ed02e00afd451bdb1ed6700b97de83c40b6a6a44916b76802b055feeae0829e4a1d7982d92eeb5ecdae3447ce8135eba6400f5da')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_LIBDIR=lib32
    -D CMAKE_INSTALL_PREFIX=/usr
    -D FLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth
    -D LIB_SUFFIX=""
    -D enable-ladspa=ON
    -D enable-portaudio=ON
    -S $_name-$pkgver
    -W no-dev
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  make check -k -C build
}

package() {
  depends+=(
    lib32-alsa-lib libasound.so
    lib32-dbus libdbus-1.so
    lib32-jack libjack.so
    lib32-libpipewire libpipewire-0.3.so
    lib32-libpulse
    lib32-libsndfile libsndfile.so
    lib32-portaudio libportaudio.so
    lib32-readline
    lib32-systemd
  )

  DESTDIR="$pkgdir" cmake --install build
  rm -rf "$pkgdir"/usr/{bin,include,share}
}
