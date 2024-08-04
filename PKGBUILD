# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.3.6
pkgrel=1
pkgdesc='A real-time software synthesizer based on the SoundFont 2 specifications'
arch=(x86_64)
url="https://www.fluidsynth.org/"
license=(LGPL-2.1-or-later)
depends=(
  fluidsynth=$pkgver
  lib32-dbus
  lib32-gcc-libs
  lib32-glibc
  lib32-libpulse
  lib32-readline
  lib32-sdl2
  lib32-systemd
)
makedepends=(
  cmake
  lib32-alsa-lib
  lib32-glib2
  lib32-jack
  lib32-ladspa
  lib32-libinstpatch
  lib32-libpipewire
  lib32-libsndfile
  lib32-portaudio
)
source=($pkgname-$pkgver.tar.gz::https://github.com/$_name/$_name/archive/v$pkgver.tar.gz)
sha512sums=('521e103e49c281ab7a44a2a275f614894062c1be6eb4df776b11e3756803c6b4b73d1e9596d364959c81b37dff4798d56798f9262c486e098f072ae1e7bef1c1')
b2sums=('74bb97e8f2026816762aeffb90c35049ae210c6827fa4a3f6a56f13c885f57b34a6b48790c86a6694100ab6d292f70b54a4516bc20317ead3d306511a33cb73c')

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
