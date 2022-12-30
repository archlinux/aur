# Maintainer: Clemmitt Sigler <cmsigler.online@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cristian Maureira <saint@archlinux.cl>
# Contributor: Dr.Egg <rwhite@archlinux.us>

pkgname=musescore3
pkgver=3.6.2
pkgrel=1
pkgdesc='Create, play and print beautiful sheet music -- Version 3; End-of-life'
arch=(x86_64)
url=https://musescore.org/
license=(GPL)
groups=(pro-audio)
depends=(
  alsa-lib
  freetype2
  libpulse
  libsndfile
  libvorbisfile.so
  libportaudio.so
  libportmidi.so
  qt5-base
  qt5-declarative
  qt5-graphicaleffects
  qt5-quickcontrols
  qt5-quickcontrols2
  qt5-svg
  qt5-tools
  qt5-xmlpatterns
  zlib
)
makedepends=(
  cmake
  doxygen
  git
  lame
  texlive-core
)
optdepends=('lame: MP3 export')
conflicts=('musescore')
provides=('musescore')
_tag=3224f342d12f4af8ea782e929c49f5ce85f97da6
source=(git+https://github.com/musescore/MuseScore.git#tag=${_tag})
sha256sums=(SKIP)

prepare() {
  cd MuseScore
  git cherry-pick -n 63d8b7ee90e9ec6604e334a3ebb12fced7fab36d
}

pkgver() {
  cd MuseScore
  git describe --tags | sed 's/^v//'
}

build() {
  cmake -S MuseScore -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS_RELEASE="$CFLAGS" \
    -DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_CRASH_REPORTER=OFF \
    -DBUILD_TELEMETRY_MODULE=OFF \
    -DBUILD_WEBENGINE=OFF \
    -DDOWNLOAD_SOUNDFONT=OFF \
    -DMUSESCORE_BUILD_CONFIG=release \
    -DMUSESCORE_REVISION=$(git rev-parse --short=7 HEAD) \
    -DPACKAGE_FILE_ASSOCIATION=ON \
    -DUSE_SYSTEM_FREETYPE=ON \
    -Wno-dev
  make -j1 lrelease manpages -C build;
  make -C build;
}

package() {
  make DESTDIR="${pkgdir}" install -C build
}

# vim: ts=2 sw=2 et:
