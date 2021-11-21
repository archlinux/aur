# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Giuseppe Calà  <jiveaxe@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=lib32-fluidsynth
_name=fluidsynth
pkgver=2.2.4
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('46c3f0759cc011f34e5ba80684df4e8b593315d564da2341aaea14a5f0ba9cf732933f6ebc8712506f194b044a8e2b198b9e50879ff4221e6a9ab8051e79b48f')
b2sums=('28a2a8048ad3f652afd424358b1b268d42672eb8fba0bdb30c72c06041617844fb5b90bc922e905d80ca2818eac03e9e5ce7f9a57b4cf68a43f60ed4bfddcd49')

build() {
  cd "${_name}-${pkgver}"
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
        -S .
  make -C build VERBOSE=1
}

check() {
  cd "${_name}-${pkgver}"
  make -C build -k check
}

package() {
  depends+=(libasound.so libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so
  libinstpatch-1.0.so libjack.so libportaudio.so libsndfile.so)

  cd "${_name}-${pkgver}"
  make -C build DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
# vim: ts=2 sw=2 et:
