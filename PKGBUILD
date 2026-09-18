# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'mako-render'
  'lib32-mako-render'
)
pkgbase=mako-render
pkgver=3.3.0
pkgrel=1
pkgdesc="Next-generation, Vulkan-powered graphics layer for Linux gaming"
arch=('x86_64')
url="https://eugeniosegala.github.io/MAKO"
license=('GPL-3.0-or-later')
depends=(
  'qt6-base'
  'qt6-declarative'
  'vulkan-icd-loader'
)
makedepends=(
  'cmake'
  'lib32-vulkan-icd-loader'
  'python'
  'vulkan-headers'
)
source=("MAKO-render-v$pkgver.tar.gz::https://github.com/eugeniosegala/MAKO/archive/refs/tags/render-v$pkgver.tar.gz")
sha256sums=('7131040e93fa64df2cb82ffe806fc7e770985a0b999cf26a6c2f44cd69373c8c')

build() {
  cd "MAKO-render-v$pkgver"
  local cmake_options=(
    -B build
    -S engine
    -W no-author
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D MAKO_BUILD_VK_LAYER='ON'
    -D MAKO_BUILD_UI='ON'
    -D MAKO_BUILD_CLI='ON'
    -D MAKO_INSTALL_XDG_FILES='ON'
    # -D MAKO_REQUIRE_NATIVE_PACKAGE_HEADERS='ON' ## Requires Vulkan headers >=1.4.362
  )
  cmake "${cmake_options[@]}"
  cmake --build build

  local cmake_options=(
    -B build_x86
    -S engine
    -W no-author
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D CMAKE_INSTALL_LIBDIR='lib32'
    -D CMAKE_CXX_FLAGS='-m32'
    -D MAKO_LAYER_LIBRARY_PATH='lib32'
    -D MAKO_SCALING_LAYER_LIBRARY_PATH='lib32'
    -D MAKO_LAYER_MANIFEST_SUFFIX='x86'
    -D MAKO_BUILD_VK_LAYER='ON'
    -D MAKO_BUILD_UI='OFF'
    -D MAKO_BUILD_CLI='OFF'
    -D MAKO_INSTALL_XDG_FILES='OFF'
    # -D MAKO_REQUIRE_NATIVE_PACKAGE_HEADERS='ON'  ## Requires Vulkan headers >=1.4.362
  )
  cmake "${cmake_options[@]}"
  cmake --build build_x86
}

check() {
  cd "MAKO-render-v$pkgver"
  local ctest_flags=(
    --test-dir build
    --output-on-failure
    --parallel $(nproc)
  )
  ctest "${ctest_flags[@]}"

  local excluded_tests="adaptive-scheduler"
  local ctest_flags=(
    --test-dir build_x86
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "$excluded_tests"
    )
  ctest  "${ctest_flags[@]}"
}

package_mako-render() {
  optdepends=('lib32-mako-render: 32-bit support')

  cd "MAKO-render-v$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}

package_lib32-mako-render() {
  pkgdesc+=" (32-bit)"
  depends=(
    'lib32-gcc-libs'
    'lib32-vulkan-icd-loader'
    'mako-render'
  )

  cd "MAKO-render-v$pkgver"
  DESTDIR="$pkgdir" cmake --install build_x86

  rm -rf "$pkgdir"/usr/{bin,share/doc}/
}
