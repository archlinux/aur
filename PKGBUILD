# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-x11
pkgver=3.23
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64' 'aarch64')
url="https://vulkan.gpuinfo.org"
license=('GPL2')
depends=('vulkan-icd-loader' 'qt5-x11extras')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_commit=e9ea1b8ecc9c566f8b87d7d2a06e40fc782521e2
source=("git+https://github.com/SaschaWillems/VulkanCapsViewer.git#commit=$_commit"
        'git+https://github.com/KhronosGroup/Vulkan-Headers.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/VulkanCapsViewer"
  git submodule init
  git config submodule.Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git submodule update
}

build() {
  cd "$srcdir/VulkanCapsViewer"
  qmake-qt5 \
    PREFIX=/usr \
    DEFINES+=X11
  make
}

package() {
  cd "$srcdir/VulkanCapsViewer"
  make INSTALL_ROOT="$pkgdir/" install

  # There's a bug preventing this from being installed automatically
  install -Dm644 gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
