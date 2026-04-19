# Maintainer: GooseStation contributors

_pkgname=goosestation-libretro
_upstream_commit=5e7be496a2d0480aaabbe9746a1a4576b469d301
_duckstation_srcdir="duckstation-${_upstream_commit}"
_overlay_commit=4caba809e33196a9c2c7bf4040ecec5f5a690bb2
_overlay_raw="https://codeberg.org/hueponik/goosestation-overlay/raw/commit/${_overlay_commit}/games-emulation/goosestation-libretro/files"
pkgname=${_pkgname}
pkgver=0+git.${_upstream_commit:0:9}
pkgrel=7
pkgdesc='Sony PlayStation libretro core based on goosified DuckStation'
arch=('x86_64' 'aarch64')
url='https://codeberg.org/hueponik/goosestation-overlay'
license=('CC-BY-NC-ND-4.0')
depends=(
  'cpuinfo-pytorch-git'
  'freetype2'
  'libjpeg-turbo'
  'libpng'
  'libwebp'
  'libzip'
  'plutosvg'
  'systemd-libs'
  'vulkan-icd-loader'
  'zlib'
  'zstd'
)
makedepends=(
  'cmake'
  'ed'
  'git'
  'pkgconf'
  'shaderc'
  'spirv-cross'
  'vulkan-headers'
)

provides=('goosestation-libretro')
conflicts=('goosestation-libretro')
source=(
  "duckstation-${_upstream_commit}.tar.gz::https://github.com/stenzek/duckstation/archive/${_upstream_commit}.tar.gz"
  "goosify.sh::${_overlay_raw}/goosify.sh"
)
sha256sums=('5ba5c07c054b3b005d82aeafdc46803fc9e2af77a591d3577b64b0a1086792d7'
            '9058a3cc4b90425099b4ca4ec727043d4ec6198e22a6e3e981a13bef49ceaba5')

prepare() {
  cd "duckstation-${_upstream_commit}"

  local goosify="${srcdir}/goosify.sh"
  install -m755 "${goosify}" .
  bash ./goosify.sh
}

build() {

  # Detect available GPU backends
  local _enable_opengl=OFF _enable_vulkan=OFF
  if pkg-config --exists gl 2>/dev/null || pkg-config --exists opengl 2>/dev/null; then
    _enable_opengl=ON
  fi
  if pkg-config --exists vulkan 2>/dev/null; then
    _enable_vulkan=ON
  fi

  cmake -S "${_duckstation_srcdir}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_DISABLE_PRECOMPILE_HEADERS=OFF \
    -DBUILD_LIBRETRO=ON \
    -DBUILD_REGTEST=OFF \
    -DBUILD_TESTS=OFF \
    -DENABLE_OPENGL=${_enable_opengl} \
    -DENABLE_VULKAN=${_enable_vulkan} \
    -DCMAKE_MODULE_PATH="${srcdir}/${_duckstation_srcdir}/cmake" \
    -DCMAKE_PREFIX_PATH="${srcdir}/${_duckstation_srcdir}/cmake" \
    -DCMAKE_CXX_FLAGS="-Wno-invalid-offsetof" \
    -Wno-dev

  cmake --build build --parallel --target goosestation_libretro
}

package() {
  install -Dm755 build/src/goosestation-libretro/goosestation_libretro.so \
    "${pkgdir}/usr/lib/libretro/goosestation_libretro.so"

  install -Dm644 "${_duckstation_srcdir}/goosestation_libretro.info" \
    "${pkgdir}/usr/share/libretro/info/goosestation_libretro.info"
}
