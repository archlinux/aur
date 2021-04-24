# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-caps-viewer
pkgver=3.01
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source=("git+https://github.com/SaschaWillems/VulkanCapsViewer#tag=$pkgver"
        "git+https://github.com/KhronosGroup/Vulkan-Headers")
sha1sums=('SKIP'
          'SKIP')
makedepends=(git)
depends=(vulkan-icd-loader qt5-base)
optdepends=(qt5-x11extras qt5-wayland)

prepare() {
  cd VulkanCapsViewer

  git submodule init
  git config submodule.Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git submodule update
}

build() {
  cd VulkanCapsViewer

  qmake \
    QMAKE_CFLAGS="$CFLAGS" \
    QMAKE_CXXFLAGS="$CXXFLAGS" \
    QMAKE_LFLAGS="$LDFLAGS" \
    PREFIX=/usr

  make
}

package() {
  cd VulkanCapsViewer

  make INSTALL_ROOT="$pkgdir" install

  # There's a bug preventing this from being installed automatically
  install -Dm644 gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
