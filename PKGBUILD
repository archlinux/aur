# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

_name=fluidsynth
pkgname=lib32-fluidsynth
pkgver=2.0.3
pkgrel=1
pkgdesc='A real-time software synthesizer based on the SoundFont 2 specifications'
arch=('x86_64')
url='http://www.fluidsynth.org/'
license=('LGPL')
depends=('fluidsynth' 'lib32-alsa-lib' 'lib32-glib2' 'lib32-glibc' 'lib32-jack'
         'lib32-dbus' 'lib32-libpulse' 'lib32-libsndfile' 'lib32-portaudio'
         'lib32-readline')
makedepends=('cmake' 'git' 'lib32-ladspa')
optdepends=('pulseaudio: PulseAudio sound support')
source=("$_name-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/v$pkgver.tar.gz")
sha512sums=('4a557c56257dc38394468e9985b811b1e56aa521b01e9ecf76a76483e6f7e94f6c905b3174203f035e972b092f09c2d099e19a3d39ac9c6ede5ac27bff93ecd3')

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
  cd "${_name}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  rm -rfv "${pkgdir}"/usr/{include,share,bin}
}

# vim: ts=2 sw=2 et:
