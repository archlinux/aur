# Maintainer: GooseStation contributors

_pkgname=goosestation-libretro
_upstream_commit=3a10c16b10d3dd23155ccd83a3af97c421d3cab1
_duckstation_srcdir="duckstation-${_upstream_commit}"
_builder_tag=v0.5
_builder_raw="https://codeberg.org/hueponik/goosestation-builder/raw/tag/${_builder_tag}"
pkgname=${_pkgname}
pkgver=0+git.${_upstream_commit:0:9}
pkgrel=2
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
  "goosestation_libretro.info::${_builder_raw}/goosestation_libretro.info"
)
sha256sums=('cb632d4460ea9a5ba4cce1e72c5e35db3e0567b9b01eb38a5c63fd75df5db600'
            'f5b335a284b3c8df5f6790711dbd9f5cb365653c8f854c675bb1362921d59078'
            'd13e909ff793991260d0f46ac76c8fe125dc5c8ab9e19c0b7942ad6c8f7bb965')

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

  install -Dm644 "${srcdir}/goosestation_libretro.info" \
    "${pkgdir}/usr/share/libretro/info/goosestation_libretro.info"
}
