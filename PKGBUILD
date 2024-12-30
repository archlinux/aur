# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.4.2
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
source=($pkgname-$pkgver.tar.gz::$_url/archive/v$pkgver.tar.gz)
sha512sums=('8c43e4e86f364f42115a51311231d9926325d7e519c2ddd087a9ed421c9a94cc0dfc5cfbfdfffe9401c634cce14c6e442523550114ac887096dde22ab0c63d98')
b2sums=('d514e595b6e902dc54ef94575701c8aa0b6b1d84d92f57874b163319076cb85c38b7c97bce70f66f55f3ef8e791608e7e29add6cb92c768e4f6ba2a4a89a1481')

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
