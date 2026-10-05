# Maintainer: Tomasz Kalisiak <tomasz.kalisiak@rhythmgame.eu>
pkgname=rhythmgame-git
_pkgname=RhythmGame
pkgver=1.3.18.r3.g2e7a9b35e
pkgrel=2
pkgdesc="A customizable BMS player for Windows and Linux – development git build"
arch=(x86_64)
url="https://github.com/Bobini1/RhythmGame"
license=(GPL-3.0-only)
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
  alsa-lib
  systemd-libs
  sdl2
  sdl2_image
  libxml2
  libxkbcommon
  qtkeychain-qt6
  tbb
  sqlite
  glibc
  libgcc
  libstdc++
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
  curl
  zip
  unzip
  clang
  rustup
)
provides=(rhythmgame)
conflicts=(rhythmgame)
source=(
  "${_pkgname}::git+https://github.com/Bobini1/RhythmGame.git"
  "vcpkg::git+https://github.com/microsoft/vcpkg.git"
  "vcpkg.json"
)
sha256sums=('SKIP'
            'SKIP'
            'f091398a474bba833a9ab0773f70e5bd410c5d37741563872babb5c97628932e')

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
  rustup toolchain install 1.96.0 --profile minimal
  cd "${srcdir}/vcpkg"
  ./bootstrap-vcpkg.sh -disableMetrics
  cd "$srcdir/$_pkgname"
  cp "$srcdir/vcpkg.json" .
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -B build -S . \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRhythmGame_DEVELOPER_MODE=OFF \
    -DRhythmGame_USE_BACKBEAT=ON \
    -DVCPKG_FEATURE_FLAGS=manifests \
    -DVCPKG_OVERLAY_PORTS="${srcdir}/${_pkgname}/vcpkgOverlayPorts" \
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
