# Maintainer: GooseStation contributors

_pkgname=goosestation-libretro
_upstream_commit=7d1996827022cc557cc26539c071dd3a54e1809b
_duckstation_srcdir="duckstation-${_upstream_commit}"
_builder_tag=v0.6.6.11443
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
  'cmake'
  'ed'
  'git'
  'pkgconf'
  'vulkan-headers'
)

source=(
  "duckstation-${_upstream_commit}.tar.gz::https://github.com/stenzek/duckstation/archive/${_upstream_commit}.tar.gz"
  "goosify-${_builder_tag}.sh::${_builder_raw}/goosify.sh"
  "goosestation_libretro-${_builder_tag}.info::${_builder_raw}/goosestation_libretro.info"
)
sha256sums=('6c2c242c7b3d0d85c7cebd0118b1e1ac4e989ade116f41b102ea42429e563fe8'
            '2901d87084be03bf15a35ee882e25e7bbc97cdf9ea452a02e0d89988e03d3641'
            '974f9b9aee21f22c91fc7e46910232ef234e1345cfccfb11b1949554555eb8ca')

prepare() {
  cd "duckstation-${_upstream_commit}"

  local goosify="${srcdir}/goosify-${_builder_tag}.sh"
  install -m755 "${goosify}" ./goosify.sh
  bash ./goosify.sh
}

build() {
  # Prefer clang if installed, else build with the system gcc (no hard clang dep).
  if [[ -z ${CC} ]] && command -v clang >/dev/null; then
    export CC=clang CXX=clang++
  fi
  cmake -S "${_duckstation_srcdir}" -B build \
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

  install -Dm644 "${srcdir}/goosestation_libretro-${_builder_tag}.info" \
    "${pkgdir}/usr/share/libretro/info/goosestation_libretro.info"
}
