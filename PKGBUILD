# Maintainer: Your Name <you@example.com>
pkgname=rhythmgame-git
_pkgname=RhythmGame
pkgver=1.1.0.r55.gb6799062
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
  spdlog
  boost
  mimalloc
  zstd
  libsndfile
  sdl2
  libxml2
  libxkbcommon
  # aur
  miniaudio
  magic_enum
  sqlitecpp
  qt6-interfaceframework
)
makedepends=(
  git
  cmake
  ninja
  pkgconf
)
provides=(rhythmgame)
conflicts=(rhythmgame)
source=(
  "${_pkgname}::git+https://github.com/Bobini1/RhythmGame.git"
  "vcpkg::git+https://github.com/microsoft/vcpkg.git"
  "vcpkg.json"
)
sha256sums=('SKIP' 'SKIP' 'bdf6cef84adb0bdb5c5b7a0cd4a10101f633eddab181bb95961ad00bb883bed9')

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
  
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/rhythmgame/LICENSE"

  install -Dm644 staticAssets/RhythmGame.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 staticAssets/icon.svg "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
}
