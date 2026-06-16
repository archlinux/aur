# Maintainer: GooseStation contributors

_pkgname=goosestation-libretro
_upstream_commit=7d1996827022cc557cc26539c071dd3a54e1809b
_duckstation_srcdir="duckstation-${_upstream_commit}"
_builder_tag=v0.6.3.11443
_builder_raw="https://codeberg.org/hueponik/goosestation-builder/raw/tag/${_builder_tag}"
pkgname=${_pkgname}
pkgver=${_builder_tag#v}
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
  'clang'
  'cmake'
  'ed'
  'git'
  'pkgconf'
  'vulkan-headers'
)

source=(
  "duckstation-${_upstream_commit}.tar.gz::https://github.com/stenzek/duckstation/archive/${_upstream_commit}.tar.gz"
  "goosify.sh::${_builder_raw}/goosify.sh"
  "goosestation_libretro.info::${_builder_raw}/goosestation_libretro.info"
)
sha256sums=('6c2c242c7b3d0d85c7cebd0118b1e1ac4e989ade116f41b102ea42429e563fe8'
            'cad14c80b019ab6632b69ef00c5905d1e735229c66a52ceaf6367a1c53a7dfd7'
            '4f9000eeb27509a42e322c48ae4922be9f57a6cc6248fa36be3899717a61208d')

prepare() {
  cd "duckstation-${_upstream_commit}"

  local goosify="${srcdir}/goosify.sh"
  install -m755 "${goosify}" .
  bash ./goosify.sh
}

build() {
  # GooseStation is built with clang (matches the builder toolchain); the
  # fastjmp file-scope asm does not link under gcc.
  cmake -S "${_duckstation_srcdir}" -B build \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_DISABLE_PRECOMPILE_HEADERS=OFF \
    -DCMAKE_MODULE_PATH="${srcdir}/${_duckstation_srcdir}/cmake" \
    -DCMAKE_PREFIX_PATH="${srcdir}/${_duckstation_srcdir}/cmake" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -Wno-invalid-offsetof" \
    -DGOOSE_UPSTREAM_ID="${_upstream_commit:0:7}" \
    -Wno-dev

  cmake --build build --parallel --target goosestation_libretro
}

package() {
  install -Dm755 build/src/goosestation-libretro/goosestation_libretro.so \
    "${pkgdir}/usr/lib/libretro/goosestation_libretro.so"

  install -Dm644 "${srcdir}/goosestation_libretro.info" \
    "${pkgdir}/usr/share/libretro/info/goosestation_libretro.info"
}
