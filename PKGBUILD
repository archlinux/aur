# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
pkgver=1.1.10
pkgrel=1
pkgdesc='A real-time software synthesizer based on the SoundFont 2 specifications'
arch=('x86_64')
url='http://www.fluidsynth.org/'
license=('LGPL')
depends=('fluidsynth' 'lib32-alsa-lib' 'lib32-glib2' 'lib32-glibc' 'lib32-jack'
         'lib32-dbus' 'lib32-libpulse' 'lib32-libsndfile' 'lib32-portaudio'
         'lib32-readline')
makedepends=('cmake' 'gcc-multilib' 'lib32-ladspa')
optdepends=('pulseaudio: PulseAudio sound support')
source=("fluidsynth-${pkgver}.tar.gz::https://github.com/FluidSynth/fluidsynth/archive/v${pkgver}.tar.gz")
sha256sums=('b74801d0fdd726c4555149bf075b76dc4074658ec0a8f7a3753f4a64589e5300')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake ../fluidsynth-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DFLUID_DAEMON_ENV_FILE='/etc/conf.d/fluidsynth' \
    -DLIB_SUFFIX='32' \
    -Denable-ladspa='ON' \
    -Denable-lash='OFF' \
    -Denable-portaudio='ON'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

# vim: ts=2 sw=2 et:
