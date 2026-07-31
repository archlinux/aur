# Maintainer: GooseStation contributors

_pkgname=goosestation-libretro
_upstream_commit=e7f2f101c2489e68446deff6dae9083e7a2114ea
_duckstation_srcdir="duckstation-${_upstream_commit}"
_builder_tag=v0.6.7.11580
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
sha256sums=('cb54185ef74ff7fdcc8ab035d4b9e4e9bba5bc7e7fe5c78a603824bd2fba7345'
            'b5c69f595c613b911968c7400473b815e9bbf407fa02e555f8acbb3ac93df854'
            'dd65dc2de0b1fc6c38f1f0c0e9ec8922c0623a8461a3fb892d659c2a64dde372')

prepare() {
  cd "duckstation-${_upstream_commit}"

  local goosify="${srcdir}/goosify-${_builder_tag}.sh"

  # goosify.sh is generated for one exact upstream commit; refuse a mismatch.
  local patch_base
  patch_base=$(sed -n 's/^# Patch: \([0-9a-f]\{40\}\).*/\1/p' "${goosify}")
  if [[ ${patch_base} != "${_upstream_commit}" ]]; then
    echo "ERROR: goosify.sh targets ${patch_base:-<no base header>}, but _upstream_commit=${_upstream_commit}" >&2
    return 1
  fi

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
