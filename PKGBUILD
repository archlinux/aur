# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cristian Maureira <saint@archlinux.cl>
# Contributor: Dr.Egg <rwhite@archlinux.us>

pkgname=musescore-git
pkgver=4.0_alpha_2.r10409.gfab8002
pkgrel=1
pkgdesc="Create, play and print beautiful sheet music"
arch=(x86_64 i686)
url="https://github.com/musescore/MuseScore"
license=(GPL-3.0-only)
groups=(pro-audio)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  libasound.so
  libfreetype.so
  libsndfile.so
  qt6-5compat
  qt6-base
  qt6-declarative
  #qt6-graphicaleffects
  qt6-networkauth
  #qt6-quickcontrols
  #qt6-quickcontrols2
  qt6-scxml
  qt6-svg
  zlib
)
makedepends=(
  cmake
  doxygen
  git
  lame
  ninja
  python
  qt6-tools
)
optdepends=('lame: MP3 export')
options=(!lto)
conflicts=(musescore)
provides=(musescore)
source=("git+https://github.com/musescore/MuseScore.git")
md5sums=('SKIP')

pkgver() {
  cd MuseScore
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

