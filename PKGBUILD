# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
pkgver=20260705
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD-2-Clause)
depends=(curl ffmpeg libgl qt6-base qt6-multimedia qt6-tools qt6-wayland ttf-liberation)
makedepends=(autoconf-archive automake cargo cmake git libtool make nasm ninja patch pkg-config tar unzip zip)
options=('!lto' '!debug' '!buildflags' '!staticlibs' '!emptydirs')
source=(
  "git+$url#commit=f4d31df69ae1fa99d4e1ac148142c78107939d43" # 2026-07-05
  "git+https://github.com/microsoft/vcpkg.git#commit=81de6771512413aaf89ea77add5ad1fda126b9d0" # 2026-06-19 (vcpkg.json:builtin-baseline)
  "hb-fc-whole-archive.patch"
  "new-tab.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  '8d4c2c434fe2af69f4e7c868a8e1dac3f7c8d562c15f96030f71754d5e60d1fe'
  '6181578991719a46beaf1440385e3ae3a569d860a14b45570cda7650f061141c'
)

prepare() {
  export VCPKG_ROOT="${srcdir}/vcpkg"
  export VCPKG_DISABLE_METRICS="true"
  export RUSTUP_TOOLCHAIN=stable

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
