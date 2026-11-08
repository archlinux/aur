# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
pkgver=20261101
pkgrel=2
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD-2-Clause)
depends=(curl ffmpeg libgl qt6-base qt6-multimedia qt6-positioning ttf-liberation vulkan-icd-loader wayland xcb-util-wm)
makedepends=(autoconf-archive automake cargo cmake git libtool make nasm ninja patch pkg-config tar unzip vulkan-headers zip)
options=('!lto' '!debug' '!buildflags' '!staticlibs' '!emptydirs')
source=(
  "git+$url#commit=c665272d1c977d8ac20f33236cb8018e2ee4770e" # 2026-11-01
  "git+https://github.com/microsoft/vcpkg.git#commit=20ceb8adbf0504d4b0d5e4058a32f9d4fc896391" # 2026-10-14 (vcpkg.json:builtin-baseline)
  "hb-fc-whole-archive.patch"
  "new-tab.patch"
  "gcc-build.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  '1324da902a0296918acc06647120553ca824b4dae84810829d3707faa15e88b4'
  '6181578991719a46beaf1440385e3ae3a569d860a14b45570cda7650f061141c'
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
  patch ladybird/Base/res/ladybird/about-pages/newtab.html < new-tab.patch
  patch ladybird/Meta/CMake/compile_options.cmake < gcc-build.patch
  sed -i -e "s/COMMIT_HASH/$(git -C ladybird show -s --format=%H)/" -e "s/COMMIT_DATE/$(git -C ladybird show -s --format=%ci)/" ladybird/Base/res/ladybird/about-pages/newtab.html

  "${VCPKG_ROOT}/bootstrap-vcpkg.sh" -disableMetrics

  cmake \
    --preset Release \
    -B build \
    -S ladybird \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    $use_linker \
    -DLADYBIRD_VCPKG_TYPE=distribution \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" \
    -DENABLE_INSTALL_HEADERS=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname%-git}" \
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

  DESTDIR="${pkgdir}" cmake --install build

  find "$pkgdir" -name '*.a' -delete
  find "$pkgdir" -name '*.cmake' -delete

  install -Dm644 ladybird/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
