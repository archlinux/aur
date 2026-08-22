# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=('vulkan-caps-viewer-x11' 'vulkan-caps-viewer-wayland')
pkgbase=vulkan-caps-viewer
pkgver=4.13
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64' 'aarch64')
url="https://vulkan.gpuinfo.org"
license=('LGPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'qt6-base'
  'vulkan-icd-loader'
)
makedepends=('git')
source=("git+https://github.com/SaschaWillems/VulkanCapsViewer.git#tag=$pkgver"
        'git+https://github.com/KhronosGroup/Vulkan-Headers.git')
sha256sums=('e58896662af51087d0464f767d622c98548475f6d6d7911f859bf6846e565357'
            'SKIP')

prepare() {

  # Create build directories
  mkdir -p build-x11 build-wayland

  cd VulkanCapsViewer
  git submodule init
  git config submodule.Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git -c protocol.file.allow=always submodule update
}

build() {

  # X11
  pushd build-x11
  qmake6 ../VulkanCapsViewer \
    DEFINES+=X11 \
    CONFIG+=release \
    PREFIX=/usr \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
  make
  popd

  # Wayland
  pushd build-wayland
  qmake6 ../VulkanCapsViewer \
    DEFINES+=WAYLAND \
    CONFIG+=release \
    PREFIX=/usr \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
  make
  popd
}

package_vulkan-caps-viewer-x11() {
  pkgdesc+=" (X11)"
  depends+=('libxcb')
  provides=('vulkan-caps-viewer')
  conflicts=('vulkan-caps-viewer')

  cd build-x11
  make INSTALL_ROOT="$pkgdir/" install

  install -m644 ../VulkanCapsViewer/gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}

package_vulkan-caps-viewer-wayland() {
  pkgdesc+=" (Wayland)"
  depends+=('wayland')
  provides=('vulkan-caps-viewer')
  conflicts=('vulkan-caps-viewer')

  cd build-wayland
  make INSTALL_ROOT="$pkgdir/" install

  install -m644 ../VulkanCapsViewer/gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
