# Maintainer: Gijs Vermeulen <gijsvrm@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=${pkgname#lib32-}
pkgver=2.6.1
pkgrel=1
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
sha512sums=('5c46421ba17559cb826fb2e6b8002b3459c910ff2ebd6d75c55f3139bea58487ddb4ac8da71c6bb72bc5af9590e11752b3d88a8e41170b8e41f228e9a08257cd')
b2sums=('257a2ffe9dd11abec672df20d006f9d9e8b18b0ba6a969f13b8caab7f1f083e66fbf3ef363d5532f638a64d141d28dddef56288906290d8fe4df2d31a16e334a')

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
