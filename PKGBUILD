# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.3.0
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
  lib32-libsndfile
  lib32-portaudio
)
options=(debug)
source=($pkgname-$pkgver.tar.gz::https://github.com/$_name/$_name/archive/v$pkgver.tar.gz)
sha512sums=('621a54f7d9845a9350381e9aa99f342b28050e1dd80983e69828acc685ace39ee5376f8e40d7a93ddb247718e4bcfb3f196cbd4027343251f8c0fbe3c0d219ed')
b2sums=('845f4b1d00b743edf7ef8a5660c239c2924ca51306fbd8f45c0c965198ed2d5267bacf8333a44720beb3f283e9a75bbb8b497dcb0b004153d5f8a9d9ed4f5224')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DCMAKE_BUILD_TYPE=None \
        -DFLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth \
        -Denable-ladspa=ON \
        -Denable-portaudio=ON \
        -Wno-dev \
        -B build \
        -S $_name-$pkgver
  make -C build VERBOSE=1
}

check() {
  make -C build -k check
}

package() {
  depends+=(libasound.so libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so
  libinstpatch-1.0.so libjack.so libportaudio.so libsndfile.so)

  make -C build DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{include,share,bin}
}
# vim: ts=2 sw=2 et:
