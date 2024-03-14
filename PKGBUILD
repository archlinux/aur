# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=('vulkan-caps-viewer-x11' 'vulkan-caps-viewer-wayland')
pkgbase=vulkan-caps-viewer
pkgver=3.34
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64' 'aarch64')
url="https://vulkan.gpuinfo.org"
license=('LGPL-3.0-or-later')
makedepends=('git' 'qt5-wayland' 'qt5-x11extras' 'vulkan-icd-loader')
_commit=2b374f469fab5ff53f62b32db9c9f8b64e38731c  # tags/3.34^0
source=("git+https://github.com/SaschaWillems/VulkanCapsViewer.git#commit=$_commit"
        'git+https://github.com/KhronosGroup/Vulkan-Headers.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd VulkanCapsViewer
  git describe --tags | sed 's/_fixed//;s/-/+/g'
}

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
  qmake-qt5 ../VulkanCapsViewer \
    DEFINES+=X11 \
    CONFIG+=release \
    PREFIX=/usr
  make
  popd

  # Wayland
  pushd build-wayland
  qmake-qt5 ../VulkanCapsViewer \
    DEFINES+=WAYLAND \
    CONFIG+=release \
    PREFIX=/usr
  make
  popd
}

package_vulkan-caps-viewer-x11() {
  pkgdesc+=" (X11)"
  depends=('hicolor-icon-theme' 'vulkan-icd-loader' 'qt5-x11extras')
  provides=('vulkan-caps-viewer')
  conflicts=('vulkan-caps-viewer')

  cd build-x11
  make INSTALL_ROOT="$pkgdir/" install

  install -m644 ../VulkanCapsViewer/gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}

package_vulkan-caps-viewer-wayland() {
  pkgdesc+=" (Wayland)"
  depends=('hicolor-icon-theme' 'vulkan-icd-loader' 'qt5-wayland')
  provides=('vulkan-caps-viewer')
  conflicts=('vulkan-caps-viewer')

  cd build-wayland
  make INSTALL_ROOT="$pkgdir/" install

  install -m644 ../VulkanCapsViewer/gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
