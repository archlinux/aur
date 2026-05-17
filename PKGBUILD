# Maintainer: GooseStation contributors

_pkgname=goosestation-libretro
_upstream_commit=54feef27dab1b105c30ad341e503c399ebb2409d
_duckstation_srcdir="duckstation-${_upstream_commit}"
_builder_commit=0c566bc1984998976603aa3f074e2d21d9252db7
_builder_raw="https://codeberg.org/hueponik/goosestation-builder/raw/commit/${_builder_commit}"
pkgname=${_pkgname}
pkgver=0+git.${_upstream_commit:0:9}
pkgrel=14
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
sha256sums=('4ff37d0bd075d64f1642aab5aca9544c30cf4df268c2fff0c62e5ff54b49c157'
            '7a748f2449274447e6b1513bf7381d5e6c16d1f5549b79fe8563dad7717d7204'
            '63131c2f6edd6361049a1fa0824e6fe0b766302c1f150a676a89716b80f6f89a')

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
