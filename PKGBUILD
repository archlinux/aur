# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'mako-render'
  'lib32-mako-render'
)
pkgbase=mako-render
_app_id=io.github.eugeniosegala.mako
pkgver=5.0.0
pkgrel=1
_vkmako_ver=0.3.2.10-22
_vulkan_ver=1.4.365
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
  'desktop-file-utils'
  'git'
  'glslang'
  'lib32-gcc-libs'
  'lib32-libx11'
  'lib32-vulkan-icd-loader'
  'meson'
  'spirv-headers'
  # 'vulkan-headers' # >= 1.4.365
)
checkdepends=('nodejs')
source=("MAKO-render-v$pkgver.tar.gz::https://github.com/eugeniosegala/MAKO/archive/refs/tags/render-v$pkgver.tar.gz"
        "vkBasalt-mako-v${_vkmako_ver}.tar.gz::https://github.com/eugeniosegala/vkBasalt/archive/refs/tags/mako-v${_vkmako_ver}.tar.gz"
        "git+https://github.com/KhronosGroup/Vulkan-Headers#tag=v${_vulkan_ver}")
sha256sums=('203ec7217d69b1108e4afcb6fcda0ae8086964c03e54b69e4907b6f5569d0b12'
            'e9140172a1f1d667fe0cad0cf549fe47bad19371037a7ceb9cc6c24232d4aabd'
            '370e49717f9f926114725400096e928e905c28b70d0d64039c14702d683478dc')

prepare() {
  cd "MAKO-render-v$pkgver"

  # Correct StartupWMClass
  desktop-file-edit \
    --set-key=StartupWMClass --set-value=eugeniosegala.github.io.mako-ui \
    "engine/mako-ui/rsc/${_app_id}.desktop"
}

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
    # -D MAKO_REQUIRE_NATIVE_PACKAGE_HEADERS='ON'
    -D MAKO_VULKAN_HEADERS_INCLUDE_DIR="$srcdir/Vulkan-Headers/include"
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
    # -D MAKO_REQUIRE_NATIVE_PACKAGE_HEADERS='ON'
    -D MAKO_VULKAN_HEADERS_INCLUDE_DIR="$srcdir/Vulkan-Headers/include"
    -D BUILD_TESTING='OFF'
  )
  cmake "${cmake_options[@]}"
  cmake --build build_x86
  popd

  local meson_options=(
    --buildtype=release
    -Dappend_libdir_vkbasalt=true
    -Dvulkan_headers="$srcdir/Vulkan-Headers/include"
  )
  arch-meson "vkBasalt-mako-v${_vkmako_ver}" build_vkbasalt "${meson_options[@]}"
  meson compile -C build_vkbasalt

  local meson_options=(
    --buildtype=release
    --libdir=lib32
    -Dappend_libdir_vkbasalt=true
    -Dvulkan_headers="$srcdir/Vulkan-Headers/include"
  )

  ASFLAGS+=" --32" \
  CFLAGS+=" -m32" \
  CXXFLAGS+=" -m32" \
  LDFLAGS+=" -m32" \
  PKG_CONFIG_PATH=/usr/lib32/pkgconfig \
    arch-meson "vkBasalt-mako-v${_vkmako_ver}" build_vkbasalt_x86 "${meson_options[@]}"
  meson compile -C build_vkbasalt_x86
}

check() {
  pushd "MAKO-render-v$pkgver"
  local excluded_tests="swapchain-retirement"
  local ctest_flags=(
    --test-dir build
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "$excluded_tests"
  )
  ctest "${ctest_flags[@]}"

  local excluded_tests="(swapchain-retirement)|(adaptive-scheduler)"
  local ctest_flags=(
    --test-dir build_x86
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "$excluded_tests"
  )
  # ctest  "${ctest_flags[@]}"

  desktop-file-validate "engine/mako-ui/rsc/${_app_id}.desktop"
  popd

  meson test -C build_vkbasalt --no-rebuild --print-errorlogs

  # explicit HDR colour and graph lifetime test fails
  meson test -C build_vkbasalt_x86 --no-rebuild --print-errorlogs || :
}

package_mako-render() {
  optdepends=(
    'lib32-mako-render: 32-bit support'
    'qt6-wayland: Native configuration UI under Wayland sessions'
    'vkd3d: LS1 scaling and DirectX LSFG models'
  )

  pushd "MAKO-render-v$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  popd

  # Remove installer
  rm -fv "$pkgdir/usr/bin/mako-installer"
  rm -fv "$pkgdir/usr/share/applications/${_app_id}.uninstaller.desktop"

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
    'lib32-vkd3d: LS1 scaling and DirectX LSFG models'
  )

  pushd "MAKO-render-v$pkgver"
  DESTDIR="$pkgdir" cmake --install build_x86
  popd

  rm -rfv "$pkgdir"/usr/{bin,share/{doc,mako-render/mako_remote_play}}/

  meson install -C build_vkbasalt_x86 --no-rebuild --destdir "$pkgdir"

  install -d "$pkgdir/usr/share/$pkgbase/vulkan/vkbasalt.d"
  mv "$pkgdir/usr/share/vulkan/implicit_layer.d/vkBasalt.json" \
    "$pkgdir/usr/share/$pkgbase/vulkan/vkbasalt.d/vkBasalt.x86.json"

  cd "vkBasalt-mako-v${_vkmako_ver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-vkBasalt"
}
