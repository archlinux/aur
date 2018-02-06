# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
pkgver=1.1.9
pkgrel=1
pkgdesc='A real-time software synthesizer based on the SoundFont 2 specifications'
arch=('x86_64')
url='http://www.fluidsynth.org/'
license=('LGPL')
depends=('fluidsynth' 'lib32-alsa-lib' 'lib32-glib2' 'lib32-glibc' 'lib32-jack'
         'lib32-dbus' 'lib32-libpulse' 'lib32-libsndfile' 'lib32-readline')
makedepends=('cmake' 'gcc-multilib' 'lib32-ladspa')
optdepends=('pulseaudio: PulseAudio sound support')
source=("fluidsynth-${pkgver}.tar.gz::https://github.com/FluidSynth/fluidsynth/archive/v${pkgver}.tar.gz")
sha256sums=('dd6321e13a7c875ef3032644bd3197e84b3d24928e2379bc8066b7cace7bd410')

prepare() {
  cd fluidsynth-$pkgver

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd fluidsynth-$pkgver/build

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLIB_SUFFIX='32' \
    -Denable-ladspa='ON'
  make
}

package() {
  cd fluidsynth-$pkgver/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

# vim: ts=2 sw=2 et:
