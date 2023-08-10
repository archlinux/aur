# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cristian Maureira <saint@archlinux.cl>
# Contributor: Dr.Egg <rwhite@archlinux.us>

pkgname=musescore-midi
pkgver=4.2.0
pkgrel=1
pkgdesc='Create, play and print beautiful sheet music / With patch for midi playback support'
arch=(x86_64)
url=https://musescore.org/
license=(GPL)
groups=(pro-audio)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  libasound.so
  libfreetype.so
  libsndfile.so
  qt5-base
  qt5-declarative
  qt5-graphicaleffects
  qt5-networkauth
  qt5-quickcontrols
  qt5-quickcontrols2
  qt5-svg
  qt5-x11extras
  qt5-xmlpatterns
  zlib
)
makedepends=(
  cmake
  doxygen
  git
  lame
  ninja
  python
  qt5-tools
)
optdepends=('lame: MP3 export')
provides=('musescore')
conflicts=('musescore')
options=(!lto)
_tag=eb8d33c7af7887f6529ea8362161233ebe262681
source=(
  git+https://github.com/musescore/MuseScore.git#tag=${_tag}
  midi.patch
)
sha256sums=(
  SKIP
  10c91b41b344535da736666ea7a1100943eb15c5e941cadf14bbef502a0b13fb
)

prepare() {
  cd MuseScore

  # Add support for MIDI output
  patch -p1 < "${srcdir}/midi.patch"

  # Fix display of scores with recent qt5-declarative
  git cherry-pick -n c747bdbcba81109e2749015a575827b2494af971
}

pkgver() {
  cd MuseScore
  git describe --tags | sed 's/^v//'
}

build() {
  cmake -S MuseScore -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_FLAGS_RELEASE="$CFLAGS" \
    -DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DMUSESCORE_BUILD_CONFIGURATION=app \
    -DMUSESCORE_BUILD_MODE=release \
    -DMUSESCORE_REVISION=$(git rev-parse --short=7 HEAD) \
    -DMUE_BUILD_CRASHPAD_CLIENT=OFF \
    -DMUE_BUILD_UNIT_TESTS=OFF \
    -DMUE_COMPILE_USE_SYSTEM_FREETYPE=ON \
    -DMUE_ENABLE_FILE_ASSOCIATION=ON \
    -DMUE_INSTALL_SOUNDFONT=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}"/usr/{bin/crashpad_handler,include,lib}
}

# vim: ts=2 sw=2 et:
