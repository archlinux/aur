# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.0.7
pkgrel=1
pkgdesc='A real-time software synthesizer based on the SoundFont 2 specifications'
arch=('x86_64')
url="https://www.fluidsynth.org/"
license=('LGPL2.1')
depends=(
  fluidsynth
  lib32-alsa-lib
  lib32-glib2
  lib32-glibc
  lib32-jack
  lib32-dbus
  lib32-libpulse
  lib32-libsndfile
  lib32-portaudio
  lib32-readline
)
makedepends=(
  cmake
  lib32-ladspa
)
optdepends=('pulseaudio: PulseAudio sound support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('b68876d24c7fb34575ffa389bcfe8e61a24f1cf1da8ec6c3b2053efde98d0320')

prepare() {
  cd "${_name}-${pkgver}"
  # out-of-tree build
  mkdir build
}

build() {
  cd "${_name}-${pkgver}/build"

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFLUID_DAEMON_ENV_FILE=/etc/conf.d/fluidsynth \
    -DLIB_SUFFIX=32 \
    -Denable-ladspa=ON \
    -Denable-lash=OFF \
    -Denable-portaudio=ON
  make
}

check() {
  cd "${_name}-${pkgver}/build"
  make -k check
}

package() {
  cd "${_name}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

# vim: ts=2 sw=2 et:
