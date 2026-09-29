# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'mako-render'
  'lib32-mako-render'
)
pkgbase=mako-render
pkgver=4.0.0
pkgrel=1
pkgdesc="Next-generation, Vulkan-powered graphics layer for Linux gaming"
arch=('x86_64')
url="https://eugeniosegala.github.io/MAKO"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libstdc++'
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
checkdepends=('desktop-file-utils')
source=("MAKO-render-v$pkgver.tar.gz::https://github.com/eugeniosegala/MAKO/archive/refs/tags/render-v$pkgver.tar.gz")
sha256sums=('37e428d8e6abedb89fdcb5d2478247968f6f3accb3daf14e9ac40e8048e5f17d')

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
    -D BUILD_TESTING='OFF'

    ## TODO
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
    -D MAKO_LAYER_MANIFEST_SUFFIX='.x86'
    -D MAKO_BUILD_VK_LAYER='ON'
    -D MAKO_BUILD_UI='OFF'
    -D MAKO_BUILD_CLI='OFF'
    -D MAKO_INSTALL_XDG_FILES='OFF'
    -D BUILD_TESTING='OFF'

    ## TODO
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
#   ctest "${ctest_flags[@]}"

  local excluded_tests="adaptive-scheduler"
  local ctest_flags=(
    --test-dir build_x86
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "$excluded_tests"
    )
#   ctest  "${ctest_flags[@]}"

  desktop-file-validate engine/mako-ui/rsc/*.desktop
}

package_mako-render() {
  optdepends=(
    'lib32-mako-render: 32-bit support'
    'qt6-wayland: Native configuration UI under Wayland sessions'
    # 'vkbasalt-mako'  ## TODO
    'vkd3d: LS1 spatial scaling'
  )

  cd "MAKO-render-v$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}

package_lib32-mako-render() {
  pkgdesc+=" (32-bit)"
  depends=(
    'lib32-gcc-libs'
    'lib32-glibc'
    'lib32-libglvnd'
    'lib32-vulkan-icd-loader'
    'mako-render'
  )
  optdepends=(
    'lib32-mesa: Zink support for 32-bit OpenGL games'
    'lib32-vkd3d: LS1 spatial scaling'
    # 'lib32-vkbasalt-mako'  ## TODO
  )

  cd "MAKO-render-v$pkgver"
  DESTDIR="$pkgdir" cmake --install build_x86

  rm -rf "$pkgdir"/usr/{bin,share/doc}/
}
