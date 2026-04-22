# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.5.4
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
sha512sums=('7539e32a56309ce61c4178dad38ac8aae82ebab37398e1a7b6d1e2d5abd0af73ae7af35358e655a935666c7e6fde30885a0d6e4b7ad8b129ab02f6aad8f18dd0')
b2sums=('a0c9d228d71479436b78ecd34c3e3df4fa58599189b929f1497afaa1add2ce757cdc957f3a2c9044545ca36d4886b080ea1f3aa2ec6596ea38a68af74fa6b1b7')

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
