# Maintainer: Eckso <eckso@eckso.io>
# Contributor: Clemmitt Sigler <cmsigler.online@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cristian Maureira <saint@archlinux.cl>
# Contributor: Dr.Egg <rwhite@archlinux.us>
# Contributor: Assarsson

pkgname=musescore3-git
pkgver=3.7.0.r20362.5cda06b
pkgrel=1
pkgdesc='Create, play and print beautiful sheet music (Jojo Schmitz fork)'
arch=(x86_64)
url=https://musescore.org/
license=(GPL)
groups=(pro-audio)
conflicts=(musescore3)
provides=(musescore3)
depends=(
  alsa-lib
  freetype2
  libpulse
  libsndfile
  libvorbis
  portaudio
  portmidi
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
_commit="5cda06ba3118f3a622a83d251149e517aa85c897"
source=(
  "git+https://github.com/Jojo-Schmitz/MuseScore.git#commit=$_commit"
  "dtl-gcc14-fix.patch"
)
sha256sums=(
  SKIP
  '84cd977e5aa7b8bdc3e3652cfd8dda125bc100a919c6dd023c5bef0e6239f112'
)

pkgver() {
  cd MuseScore
  printf "%s.r%s.%s" \
    "$(grep ^Version= build/PortableApps/appinfo.ini.in | cut -d = -f 2 | tr -d '\r')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
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
    -DMUSESCORE_REVISION=${_commit:0:7} \
    -DPACKAGE_FILE_ASSOCIATION=ON \
    -DUSE_SYSTEM_FREETYPE=ON \
    -Wno-dev \
    -DMSCORE_INSTALL_SUFFIX=3

  make -j1 lrelease manpages -C build
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" install -C build
}

prepare() {
  cd MuseScore
  patch --strip=1 --input=../dtl-gcc14-fix.patch
}

# vim: ts=2 sw=2 et:
