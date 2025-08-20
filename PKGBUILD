# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
pkgver=20250820
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD-2-Clause)
depends=(curl ffmpeg libgl qt6-base qt6-multimedia qt6-tools qt6-wayland ttf-liberation)
makedepends=(autoconf-archive automake cmake git nasm ninja tar unzip zip)
options=('!lto' '!debug' '!buildflags' '!staticlibs' '!emptydirs')
source=(
  "git+$url#commit=cd08b3b6f49507a1b0c2b0bce3e9d082beb1ded1" # 2025-08-20
  "git+https://github.com/microsoft/vcpkg.git#commit=ee0973d8090e4e3e452244bb50d34c25fe907dc2" # 2025-08-19 (vcpkg.json:builtin-baseline)
  "ladybird.desktop"
  "hb-fc-whole-archive.patch"
  "new-tab.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'c83838259b1b8cf1c7118b706286c99977223439bbcc056694e2952708bf2350'
  'e830f31f65032f3aa8443f3e906241e762b6cc191c9372dbcd1111985a4e3929'
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

  install -Dm644 "ladybird.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "ladybird/Base/res/icons/128x128/app-browser.png" "${pkgdir}/usr/share/pixmaps/ladybird.png"

  install -Dm644 ladybird/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
