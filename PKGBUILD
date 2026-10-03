# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'mako-render'
  'lib32-mako-render'
)
pkgbase=mako-render
pkgver=4.0.0
pkgrel=3
_vkmako_ver=0.3.2.10-10
pkgdesc="Next-generation, Vulkan-powered graphics layer for Linux gaming"
arch=('x86_64')
url="https://eugeniosegala.github.io/MAKO"
license=(
  'GPL-3.0-or-later'
  'Zlib'
)
depends=(
  'bash'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'libx11'
  'python'
  'qt6-base'
  'qt6-declarative'
  'vulkan-icd-loader'
)
makedepends=(
  'cmake'
  'glslang'
  'lib32-vulkan-icd-loader'
  'lib32-libx11'
  'meson'
  'spirv-headers'
  'vulkan-headers'
)
checkdepends=('desktop-file-utils')
source=("MAKO-render-v$pkgver.tar.gz::https://github.com/eugeniosegala/MAKO/archive/refs/tags/render-v$pkgver.tar.gz"
        "vkBasalt-mako-v${_vkmako_ver}.tar.gz::https://github.com/eugeniosegala/vkBasalt/archive/refs/tags/mako-v${_vkmako_ver}.tar.gz")
sha256sums=('37e428d8e6abedb89fdcb5d2478247968f6f3accb3daf14e9ac40e8048e5f17d'
            'cb41e08b8ff11c90c801f5b8332258ec6711174ba70179888e68a0a7b6d6269f')

build() {
  pushd "MAKO-render-v$pkgver"
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
    -D MAKO_REQUIRE_NATIVE_PACKAGE_HEADERS='ON'
    -D BUILD_TESTING='ON'
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
    -D MAKO_REQUIRE_NATIVE_PACKAGE_HEADERS='ON'
    -D BUILD_TESTING='OFF'
  )
  cmake "${cmake_options[@]}"
  cmake --build build_x86
  popd

  arch-meson "vkBasalt-mako-v${_vkmako_ver}" build_vkbasalt \
    --buildtype=release \
    -Dappend_libdir_vkbasalt=true
  meson compile -C build_vkbasalt

  ASFLAGS+=" --32" \
  CFLAGS+=" -m32" \
  CXXFLAGS+=" -m32" \
  LDFLAGS+=" -m32" \
  PKG_CONFIG_PATH=/usr/lib32/pkgconfig \
    arch-meson "vkBasalt-mako-v${_vkmako_ver}" build_vkbasalt_x86 \
      --buildtype=release \
      --libdir=lib32 \
      -Dappend_libdir_vkbasalt=true
  meson compile -C build_vkbasalt_x86
}

check() {
  pushd "MAKO-render-v$pkgver"
  local excluded_tests="(arch-package-contract)|(portable-policy)"
  local ctest_flags=(
    --test-dir build
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "$excluded_tests"
  )
   ctest "${ctest_flags[@]}"

  local excluded_tests="adaptive-scheduler"
  local ctest_flags=(
    --test-dir build_x86
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "$excluded_tests"
    )
#   ctest  "${ctest_flags[@]}"

  desktop-file-validate engine/mako-ui/rsc/*.desktop
  popd

  meson test -C build_vkbasalt --no-rebuild --print-errorlogs
  meson test -C build_vkbasalt_x86 --no-rebuild --print-errorlogs
}

package_mako-render() {
  optdepends=(
    'lib32-mako-render: 32-bit support'
    'qt6-wayland: Native configuration UI under Wayland sessions'
    'vkd3d: LS1 spatial scaling'
  )

  pushd "MAKO-render-v$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  popd

  meson install -C build_vkbasalt --no-rebuild --destdir "$pkgdir"

  install -d "$pkgdir/usr/share/$pkgbase/vulkan/vkbasalt.d"
  mv "$pkgdir/usr/share/vulkan/implicit_layer.d/vkBasalt.json" \
    "$pkgdir/usr/share/$pkgbase/vulkan/vkbasalt.d/"

  cd "vkBasalt-mako-v${_vkmako_ver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-vkBasalt"
}

package_lib32-mako-render() {
  pkgdesc+=" (32-bit)"
  depends=(
    'lib32-gcc-libs'
    'lib32-glibc'
    'lib32-libglvnd'
    'lib32-vulkan-icd-loader'
    'lib32-libx11'
    'mako-render'
  )
  optdepends=(
    'lib32-mesa: Zink support for 32-bit OpenGL games'
    'lib32-vkd3d: LS1 spatial scaling'
  )

  pushd "MAKO-render-v$pkgver"
  DESTDIR="$pkgdir" cmake --install build_x86
  popd

  rm -rf "$pkgdir"/usr/{bin,share/doc}/

  meson install -C build_vkbasalt_x86 --no-rebuild --destdir "$pkgdir"

  install -d "$pkgdir/usr/share/$pkgbase/vulkan/vkbasalt.d"
  mv "$pkgdir/usr/share/vulkan/implicit_layer.d/vkBasalt.json" \
    "$pkgdir/usr/share/$pkgbase/vulkan/vkbasalt.d/vkBasalt.x86.json"

  cd "vkBasalt-mako-v${_vkmako_ver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-vkBasalt"
}
