# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
pkgver=1.1.6
pkgrel=1
pkgdesc='A real-time software synthesizer based on the SoundFont 2 specifications'
arch=('x86_64')
url='http://www.fluidsynth.org/'
license=('LGPL')
depends=('fluidsynth' 'lib32-alsa-lib' 'lib32-glib2' 'lib32-glibc' 'lib32-jack'
         'lib32-libdbus' 'lib32-libpulse' 'lib32-libsndfile' 'lib32-readline')
makedepends=('cmake' 'gcc-multilib' 'lib32-ladspa')
optdepends=('pulseaudio: PulseAudio sound support')
source=("http://downloads.sourceforge.net/fluidsynth/fluidsynth-$pkgver.tar.gz")
sha256sums=('50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d96b5bccee2171c')

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
