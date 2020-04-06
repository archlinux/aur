# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.1.2
pkgrel=1
pkgdesc='A real-time software synthesizer based on the SoundFont 2 specifications'
arch=('x86_64')
url="https://www.fluidsynth.org/"
license=('LGPL2.1')
depends=(
  fluidsynth
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('9206d83b8d2f7e1ec259ee01e943071de67e419aabe142b51312f8edb39c5503')

build() {
  cd "${_name}-${pkgver}"

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth \
        -DLIB_SUFFIX=32 \
        -Denable-ladspa=ON \
        -Denable-portaudio=ON \
        -B build
  make -C build VERBOSE=1
}

check() {
  cd "${_name}-${pkgver}"
  make -C build -k check
}

package() {
  depends+=('libasound.so' 'libdbus-1.so' 'libglib-2.0.so' 'libgmodule-2.0.so'
  'libgobject-2.0.so' 'libinstpatch-1.0.so' 'libjack.so' 'libportaudio.so'
  'libsndfile.so')
  cd "${_name}-${pkgver}"

  make -C build DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
# vim: ts=2 sw=2 et:
