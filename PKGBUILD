# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
pkgname=vulkan-caps-viewer-x11
pkgver=3.02
pkgrel=1
pkgdesc="Vulkan Hardware Capability Viewer"
arch=('x86_64')
url="http://vulkan.gpuinfo.org"
license=('GPL2')
depends=('vulkan-icd-loader' 'qt5-x11extras')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/SaschaWillems/VulkanCapsViewer.git#tag=$pkgver"
        'git+https://github.com/KhronosGroup/Vulkan-Headers.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/${pkgname%-*}"
  git submodule init
  git config submodule.Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git submodule update
}

build() {
  cd "$srcdir/${pkgname%-*}"
  qmake \
    QMAKE_CFLAGS="$CFLAGS" \
    QMAKE_CXXFLAGS="$CXXFLAGS" \
    QMAKE_LFLAGS="$LDFLAGS" \
    PREFIX=/usr \
    DEFINES+=X11
  make
}

package() {
  cd "$srcdir/${pkgname%-*}"
  make INSTALL_ROOT="$pkgdir/" install

  # There's a bug preventing this from being installed automatically
  install -Dm644 gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
