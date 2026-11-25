# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
epoch=1
pkgver=2026.47.8
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD-2-Clause)
depends=(curl ffmpeg libgl qt6-base qt6-multimedia qt6-positioning ttf-liberation vulkan-icd-loader wayland xcb-util-wm)
makedepends=(autoconf-archive automake cargo cmake git libtool make nasm ninja patch pkg-config tar unzip vulkan-headers zip)
options=('!lto' '!debug' '!buildflags' '!staticlibs' '!emptydirs')
source=(
  "git+$url#tag=${pkgver}"
  "git+https://github.com/microsoft/vcpkg.git#commit=8f363bdc11359ede4bc51e5eb32a2617538049c8" # vcpkg.json:builtin-baseline
  "hb-fc-whole-archive.patch"
  "gcc-build.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'e268aed76a27dc8519be00f6c30a59ce2339683127839f8e097d14d92d7b4268'
  '4065634ed192973510df368f9148a19fbf4f2ebd1d7681c53163fa6f70f0412d'
)

prepare() {
  export VCPKG_ROOT="${srcdir}/vcpkg"
  export VCPKG_DISABLE_METRICS="true"
  unset CARGO_TARGET_DIR
  export RUSTUP_TOOLCHAIN="$(sed -n 's/^channel = "\(.*\)"/\1/p' ladybird/rust-toolchain.toml)"

  local use_linker=
  if ! echo $'#if defined(__clang__)\nWE ARE ON CLANG\n#endif' | "${CC:-/usr/bin/cc}" -E - | grep -q 'WE ARE ON CLANG'; then
    echo "Disabling LTO on Release build with GCC"
    use_linker='-DENABLE_LTO_FOR_RELEASE=OFF'
  fi

  patch ladybird/UI/Qt/CMakeLists.txt < hb-fc-whole-archive.patch
  patch ladybird/Meta/CMake/compile_options.cmake < gcc-build.patch

  "${VCPKG_ROOT}/bootstrap-vcpkg.sh" -disableMetrics

  cmake \
    --preset Release \
    -B build \
    -S ladybird \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DLADYBIRD_VERSION="${pkgver}" \
    $use_linker \
    -DLADYBIRD_VCPKG_TYPE=distribution \
    -DCMAKE_INSTALL_PREFIX='/opt/ladybird' \
    -DCMAKE_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" \
    -DENABLE_INSTALL_HEADERS=OFF \
    -GNinja \
    -Wno-dev
}

build() {
  cd "${srcdir}"
  unset CARGO_TARGET_DIR
  export RUSTUP_TOOLCHAIN="$(sed -n 's/^channel = "\(.*\)"/\1/p' ladybird/rust-toolchain.toml)"
  cmake --build build
}

package() {
  cd "${srcdir}"

  local _component
  for _component in ladybird_Runtime ladybird_SystemIntegration js wasm; do
    DESTDIR="${pkgdir}" cmake --install build --component "${_component}"
  done
  ln -s /opt/ladybird/bin/js "${pkgdir}/usr/bin/js"
  ln -s /opt/ladybird/bin/wasm "${pkgdir}/usr/bin/wasm"

  find "$pkgdir" -name '*.a' -delete
  find "$pkgdir" -name '*.cmake' -delete

  install -Dm644 ladybird/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
