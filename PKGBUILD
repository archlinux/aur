# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=fluidsynth-git
pkgver=1.1.6.r423.048c51c
pkgrel=1
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications (development version)"
arch=('i686' 'x86_64')
url="http://www.fluidsynth.org/"
license=('LGPL')
depends=('glib2' 'jack' 'libpulse' 'alsa-lib' 'ladspa')
makedepends=('git' 'cmake')
optdepends=('pulseaudio: PulseAudio sound support')
conflicts=('fluidsynth')
provides=("fluidsynth=${pkgver%.r*}")
source=(${pkgname%-*}::"git+http://git.code.sf.net/p/fluidsynth/code-git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}/${pkgname%-*}

  _major=$(grep -o "FLUIDSYNTH_VERSION_MAJOR.*" CMakeLists.txt | grep -o "[0-9]*")
  _minor=$(grep -o "FLUIDSYNTH_VERSION_MINOR.*" CMakeLists.txt | grep -o "[0-9]*")
  _micro=$(grep -o "FLUIDSYNTH_VERSION_MICRO.*" CMakeLists.txt | grep -o "[0-9]*")
  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "$_major.$_minor.$_micro.r%s.%s" "$_rev" "$_hash"
}

build() {
  cd ${pkgname%-*}

  cmake ${pkgname%-*} -DCMAKE_INSTALL_PREFIX=/usr \
                      -DCMAKE_BUILD_TYPE=Release \
                      -Denable-ladspa=ON \
                      -DLIB_SUFFIX=""
  make
}

package() {
  make -C ${pkgname%-*} DESTDIR="$pkgdir/" install
}
