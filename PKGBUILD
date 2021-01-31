# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.1.7
pkgrel=1
pkgdesc='A real-time software synthesizer based on the SoundFont 2 specifications'
arch=('x86_64')
url="https://www.fluidsynth.org/"
license=('LGPL2.1')
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('22ab9bb3c5d5e619c0624ced2031b23d9d68cf9ffd6da40087aa0049f486b8c6201ff19605fc73fa642358bec31c18bb43683a8b0d603b198626d9a23721bcd6')
b2sums=('5e9bd1c2182f73e36c748396e53957396b59a0325ca1fa1eab00af9f317d6134683902779d5c7f54da787e7f12149c257561c34b47956e31abe246e3825e6fb5')

build() {
  cd "${_name}-${pkgver}"
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DFLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth \
        -DLIB_SUFFIX=32 \
        -Denable-ladspa=ON \
        -Denable-portaudio=ON \
        -Wno-dev \
        -B build \
        -S .
  make -C build VERBOSE=1
}

check() {
  cd "${_name}-${pkgver}"
  make -C build -k check
}

package() {
  depends+=('libasound.so' 'libglib-2.0.so' 'libgmodule-2.0.so'
  'libgobject-2.0.so' 'libinstpatch-1.0.so' 'libjack.so' 'libportaudio.so'
  'libsndfile.so')
  cd "${_name}-${pkgver}"

  make -C build DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
# vim: ts=2 sw=2 et:
