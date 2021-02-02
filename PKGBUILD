# Maintainer: Lubosz Sarnecki <lubosz [at] gmail [dot] com>

pkgname=vulkan-caps-viewer-git
pkgver=3.0.351.03d0920
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source=('vulkan-caps-viewer.desktop')
sha1sums=('7ccdb4b4487b43bb428c32994092c00ca14f594a')
source=("git+https://github.com/SaschaWillems/VulkanCapsViewer.git"
               "git+https://github.com/KhronosGroup/Vulkan-Headers")
sha1sums=('SKIP' 'SKIP')
makedepends=(git)
depends=(vulkan-icd-loader qt5-x11extras hicolor-icon-theme)
conflicts=('vulkan-caps-viewer')
provides=('vulkan-caps-viewer')

pkgver() {
  cd $srcdir/VulkanCapsViewer
  
  version=$(grep "vulkanCapsViewer::version" vulkancapsviewer.cpp | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash  
}

prepare() {
  cd VulkanCapsViewer

  git submodule init
  git config submodule.Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git submodule update
}

build() {
  cd $srcdir/VulkanCapsViewer
  qmake \
    DEFINES+=X11 \
    QMAKE_CFLAGS="$CFLAGS" \
    QMAKE_CXXFLAGS="$CXXFLAGS" \
    QMAKE_LFLAGS="$LDFLAGS" \
    PREFIX=/usr
  make
}

package() {
  cd $srcdir/VulkanCapsViewer

  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 "${srcdir}"/VulkanCapsViewer/gfx/android_icon_256.png \
    "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
