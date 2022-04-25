# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.2.7
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
optdepends=('pulseaudio: PulseAudio sound support')
options=(debug)
source=($pkgname-$pkgver.tar.gz::https://github.com/$_name/$_name/archive/v$pkgver.tar.gz)
sha512sums=('62709f96fa07bbafb9b907438da7376abdf1a4e679cd2b105c5bca257f1ff62c18bd4c646ef2ccba64ca5273604da996fb2caaf61eeee44686bf45fef1ed83a7')
b2sums=('fd53603947ddf5a76676cfc3d77b1d904146ec7c30ab6e54a2c32cae0e76ec4b66397506072cac277febdd1b799801d5b13c7b37cc0ea4a545fae26077a1d881')

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
