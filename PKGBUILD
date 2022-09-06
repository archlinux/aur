# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.2.9
pkgrel=1
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
sha512sums=('90f44f6d7a4ed504eea5e2d39d8da2e0072bef746f3d969e367f0bab36a4cff479a98e795dc8b6b58b565fb266c44a137a14e98c7e4c77d1be3b300b8c066600')
b2sums=('a6b4a19737d01e86a80084cdf88897da9af7d2c50be80fb0227a1d70effb8551667ae27f43ce63591830acfdef31ff0d99d51e3160b9b09c274637b259a82833')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DFLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth \
        -DLIB_SUFFIX=32 \
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
