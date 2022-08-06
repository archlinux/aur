# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-wayland
pkgver=3.24
pkgrel=1
epoch=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64' 'aarch64')
url="https://vulkan.gpuinfo.org"
license=('GPL2')
depends=('vulkan-icd-loader' 'qt5-wayland')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_commit=5e63a77208aaf9162f583e426edd3edc3eaed370 # tags/3.24^
source=("git+https://github.com/SaschaWillems/VulkanCapsViewer.git#commit=$_commit"
        'git+https://github.com/KhronosGroup/Vulkan-Headers.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/VulkanCapsViewer"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/VulkanCapsViewer"
  git submodule init
  git config submodule.Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git submodule update
}

build() {
  cd "$srcdir/VulkanCapsViewer"
  qmake-qt5 \
    DEFINES+=WAYLAND \
    CONFIG+=release \
    PREFIX=/usr
  make
}

package() {
  cd "$srcdir/VulkanCapsViewer"
  make INSTALL_ROOT="$pkgdir/" install

  # There's a bug preventing this from being installed automatically
  install -m644 gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
