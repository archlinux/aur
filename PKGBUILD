# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
pkgver=20250930
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD-2-Clause)
depends=(curl ffmpeg libgl qt6-base qt6-multimedia qt6-tools qt6-wayland ttf-liberation)
makedepends=(autoconf-archive automake cmake git nasm ninja tar unzip zip)
options=('!lto' '!debug' '!buildflags' '!staticlibs' '!emptydirs')
source=(
  "git+$url#commit=c79063a77d6cce2d841e134c4e4b8993da0bad7d" # 2025-09-30
  "git+https://github.com/microsoft/vcpkg.git#commit=b0b3de1b1a0aa4b8f2822460aa7f42f991629b3f" # 2025-09-26 (vcpkg.json:builtin-baseline)
  "hb-fc-whole-archive.patch"
  "new-tab.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'cf2cf709c6be6e39ac04ea5bf69f30ccc3d16bad87dbf95c6aad04b47e37cfe8'
  '7f50eb833838df5fcd1fc0aa0eea986ed93cd670c283dad4ac5276e7c9e3ffbe'
)

prepare() {
  export VCPKG_ROOT="${srcdir}/vcpkg"
  export VCPKG_DISABLE_METRICS="true"

  local use_linker=
  if ! echo $'#if defined(__clang__)\nWE ARE ON CLANG\n#endif' | "${CC:-/usr/bin/cc}" -E - | grep -q 'WE ARE ON CLANG'; then
    echo "Disabling LTO on Release build with GCC"
    use_linker='-DENABLE_LTO_FOR_RELEASE=OFF'
  fi

  patch ladybird/UI/Qt/CMakeLists.txt < hb-fc-whole-archive.patch
  patch ladybird/Base/res/ladybird/about-pages/newtab.html < new-tab.patch
  sed -i -e "s/COMMIT_HASH/$(git -C ladybird show -s --format=%H)/" -e "s/COMMIT_DATE/$(git -C ladybird show -s --format=%ci)/" ladybird/Base/res/ladybird/about-pages/newtab.html

  cmake \
    --preset Release \
    -B build \
    -S ladybird \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    $use_linker \
    -DVCPKG_OVERLAY_TRIPLETS="${srcdir}/ladybird/Meta/CMake/vcpkg/distribution-triplets" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" \
    -DENABLE_INSTALL_HEADERS=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname%-git}" \
    -GNinja \
    -Wno-dev
}

build() {
  cd "${srcdir}"
  cmake --build build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" cmake --install build

  find "$pkgdir" -name '*.a' -delete
  find "$pkgdir" -name '*.cmake' -delete

  install -Dm644 ladybird/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
