# Maintainer: GooseStation contributors

_pkgname=goosestation-libretro
_upstream_commit=e8938f06347e4837c32ef4c71c21cbd43245f244
_duckstation_srcdir="duckstation-${_upstream_commit}"
_builder_tag=v0.6
_builder_raw="https://codeberg.org/hueponik/goosestation-builder/raw/tag/${_builder_tag}"
pkgname=${_pkgname}
pkgver=0+git.${_upstream_commit:0:9}
pkgrel=1
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
sha256sums=('c7c8de5f627edb3c82d9a8fc83897688d3555df30a64299947d6ee0497d39965'
            'c3b8d7b8ee8005df57db623b36f31d2f359e9b68844159389ccafdbdda643cd7'
            'f5d778c7dd5a06d22cc5418e4dd6dd2cbd44176cbfddf15efca9477a9c46962d')

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
