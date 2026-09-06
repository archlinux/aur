# Maintainer: Tomasz Kalisiak <tomasz.kalisiak@rhythmgame.eu>
pkgname=rhythmgame-git
_pkgname=RhythmGame
pkgver=1.3.17.r0.g794ab7c98
pkgrel=1
pkgdesc="A customizable BMS player for Windows and Linux – development git build"
arch=(x86_64)
url="https://github.com/Bobini1/RhythmGame"
license=(MIT)
depends=(
  qt6-base
  qt6-declarative
  qt6-multimedia
  qt6-svg
  qt6-shadertools
  qt6-websockets
  fmt
  spdlog
  boost
  mimalloc
  zstd
  libsndfile
  sdl2
  sdl2_image
  libxml2
  libxkbcommon
  qtkeychain-qt6
  # aur
  miniaudio
  magic_enum
  sqlitecpp
  zlib
  zlib-ng
  openimageio
  libzip
)
makedepends=(
  git
  cmake
  ninja
  pkgconf
  autoconf-archive
  qt6-tools
)
provides=(rhythmgame)
conflicts=(rhythmgame)
source=(
  "${_pkgname}::git+https://github.com/Bobini1/RhythmGame.git"
  "vcpkg::git+https://github.com/microsoft/vcpkg.git"
  "vcpkg.json"
  "link-system-zlib.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'dacf65553b650c5d82f33f5dfde4f4eeabb0840b34d7914a60629659f9f41ae6'
            '94825be16b3aa1c46129924da6b1f5dd33ffac37998a3101ef78c63b5e8dd6f4')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Format: tagged_version.r<revcount>.g<shortsha>
  local tag
  tag=$(git describe --tags --abbrev=0 2>/dev/null || echo 1.1.0)
  local revcount
  revcount=$(git rev-list --count "${tag}"..HEAD 2>/dev/null || echo 0)
  short=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "${tag#v}" "${revcount}" "${short}"
}

prepare() {
  cd "${srcdir}/vcpkg"
  ./bootstrap-vcpkg.sh -disableMetrics
  cd "$srcdir/$_pkgname"
  cp "$srcdir/vcpkg.json" .
  patch -Np1 -i "$srcdir/link-system-zlib.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -B build -S . \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRhythmGame_DEVELOPER_MODE=OFF \
    -DVCPKG_FEATURE_FLAGS=manifests \
    -DCMAKE_CXX_STANDARD=23 \
    -DUSE_SYSTEM_LIBRARIES=ON \
    -Wno-dev \
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}/vcpkg/scripts/buildsystems/vcpkg.cmake"

  cmake --build build
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}
