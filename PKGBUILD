# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.5.0
pkgrel=1
pkgdesc='A real-time software synthesizer based on the SoundFont 2 specifications'
arch=(x86_64)
url="https://www.fluidsynth.org/"
_url="https://github.com/fluidsynth/fluidsynth"
license=(LGPL-2.1-or-later)
depends=(
  fluidsynth=$pkgver
  lib32-dbus
  lib32-gcc-libs
  lib32-glibc
  lib32-libpulse
  lib32-readline
  lib32-sdl3
  lib32-systemd
)
makedepends=(
  cmake
  lib32-alsa-lib
  lib32-glib2
  lib32-jack
  lib32-ladspa
  lib32-libpipewire
  lib32-libsndfile
  lib32-portaudio
)
source=($_name-$pkgver.tar.gz::$_url/archive/v$pkgver.tar.gz)
sha512sums=('8f326db4049b3241c7a0472aa5db8c715dcfc0a1ce9c5fda492bf84e6c17e27a2298131a58a51e275797259a434e59bfe3f53d85358f903652dca8de753a3376')
b2sums=('318de46cffe82689ec2eac64e3a074a86521c96e37df27bff5ac3d84f141cad2001b7e6902db5bfb5845916819eb239ed07c48068802b1ea081250fa3c721a24')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_LIBDIR=lib32
    -D CMAKE_INSTALL_PREFIX=/usr
    -D FLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth
    -D enable-ladspa=ON
    -D enable-portaudio=ON
    -W no-dev
    -S $_name-$pkgver
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  make -C build -k check
}

package() {
  depends+=(
    lib32-alsa-lib libasound.so
    lib32-glib2 libglib-2.0.so libgmodule-2.0.so
    lib32-jack libjack.so
    lib32-libpipewire libpipewire-0.3.so
    lib32-libsndfile libsndfile.so
    lib32-portaudio libportaudio.so
  )

  DESTDIR="$pkgdir" cmake --install build
  rm -rf "$pkgdir"/usr/{include,share,bin}
}
# vim: ts=2 sw=2 et:
