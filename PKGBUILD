# Maintainer: GooseStation contributors

_pkgname=goosestation-libretro
_upstream_commit=5e7be496a2d0480aaabbe9746a1a4576b469d301
_duckstation_srcdir="duckstation-${_upstream_commit}"
_builder_commit=857a015dc6fa690aea5c134ad359575bc407666a
_builder_raw="https://codeberg.org/hueponik/goosestation-builder/raw/commit/${_builder_commit}"
pkgname=${_pkgname}
pkgver=0+git.${_upstream_commit:0:9}
pkgrel=12
pkgdesc='Sony PlayStation libretro core based on goosified DuckStation'
arch=('x86_64' 'aarch64')
url='https://codeberg.org/hueponik/goosestation-builder'
license=('CC-BY-NC-ND-4.0')
depends=(
  'cpuinfo-pytorch-git'
  'libjpeg-turbo'
  'libpng'
  'libwebp'
  'shaderc'
  'spirv-cross'
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
  'vulkan-headers'
)

provides=('goosestation-libretro')
conflicts=('goosestation-libretro')
source=(
  "duckstation-${_upstream_commit}.tar.gz::https://github.com/stenzek/duckstation/archive/${_upstream_commit}.tar.gz"
  "goosify.sh::${_builder_raw}/goosify.sh"
)
sha256sums=('5ba5c07c054b3b005d82aeafdc46803fc9e2af77a591d3577b64b0a1086792d7'
            '25304a8b936eeff80499fe933561b36dc673dac0d1fa6c1b92fdc72ead8a5076')

prepare() {
  cd "duckstation-${_upstream_commit}"

  local goosify="${srcdir}/goosify.sh"
  install -m755 "${goosify}" .
  bash ./goosify.sh
}

build() {
  cmake -S "${_duckstation_srcdir}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_DISABLE_PRECOMPILE_HEADERS=OFF \
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
