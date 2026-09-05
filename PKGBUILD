# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'lsfg-vk'
  'lib32-lsfg-vk'
)
pkgbase=lsfg-vk
_app_id="gay.pancake.$pkgbase-ui"
pkgver=2.0.0
pkgrel=1
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=('x86_64')
url="https://lsfg-vk.dev"
license=('CC-BY-NC-ND-4.0')
depends=(
  'hicolor-icon-theme'
  'qt6-base'
  'qt6-declarative'
  'vulkan-icd-loader'
)
makedepends=(
  'cmake'
  'desktop-file-utils'
  'git'
)
checkdepends=('appstream')
install="$pkgbase.install"
source=("git+https://git.lsfg-vk.dev/lsfg-vk.git#tag=$pkgver")
sha256sums=('150b29e94f257797cab7e79d1649477da09f0830af361f944395490dcbfbf11e')

prepare() {
  cd "$pkgbase"

  # Correct StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="$pkgbase-ui" \
    "$pkgbase-ui/resources/${_app_id}.desktop"
}

build() {
  local cmake_options=(
    -B build
    -S "$pkgbase"
    -W no-author
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D CMAKE_INTERPROCEDURAL_OPTIMIZATION='ON'
    -D LSFGVK_LAYER_MULTILIB_X86='OFF'
    -D LSFGVK_MANAGED='ON'
    -D LSFGVK_BUILD_LAYER='ON'
    -D LSFGVK_BUILD_UI='ON'
    -D LSFGVK_BUILD_CLI='ON'
    -D LSFGVK_INSTALL_LIBRARIES='ON'
  )
  cmake "${cmake_options[@]}"
  cmake --build build

  local cmake_options=(
    -B build_x86
    -S "$pkgbase"
    -W no-author
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D CMAKE_INTERPROCEDURAL_OPTIMIZATION='ON'
    -D CMAKE_CXX_FLAGS=-m32
    -D LSFGVK_LAYER_LIBRARY_PATH='liblsfg-vk-layer.x86.so'
    -D LSFGVK_LAYER_MULTILIB_X86='ON'
    -D LSFGVK_MANAGED='ON'
    -D LSFGVK_BUILD_LAYER='ON'
    -D LSFGVK_BUILD_UI='OFF'
    -D LSFGVK_BUILD_CLI='OFF'
    -D LSFGVK_INSTALL_LIBRARIES='OFF'
  )
  cmake "${cmake_options[@]}"
  cmake --build build_x86
}

check() {
  cd "$pkgbase"
  appstreamcli validate --no-net "dist/flatpak/lsfg-vk-ui/${_app_id}.metainfo.xml"
  desktop-file-validate "$pkgbase-ui/resources/${_app_id}.desktop"
}

package_lsfg-vk() {
  optdepends=('lib32-lsfg-vk: 32-bit support')

  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgbase"
  install -Dm644 "$pkgbase-ui/resources/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "$pkgbase-ui/resources/${_app_id}.png" -t \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
  install -Dm644 "dist/flatpak/$pkgbase-ui/${_app_id}.metainfo.xml" -t \
    "$pkgdir/usr/share/metainfo/"
}

package_lib32-lsfg-vk() {
  pkgdesc+=" (32-bit)"
  depends=(
    'lib32-gcc-libs'
    'lib32-vulkan-icd-loader'
    'lsfg-vk'
  )

  DESTDIR="$pkgdir" cmake --install build_x86
}
