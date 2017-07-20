# Maintainer: Lubosz Sarnecki <lubosz [at] gmail [dot] com>

pkgname=vulkan-caps-viewer-git
pkgver=1.4.104.f3e18c6
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source=('vulkan-caps-viewer.desktop')
sha1sums=('7ccdb4b4487b43bb428c32994092c00ca14f594a')
source_x86_64=("git+https://github.com/SaschaWillems/VulkanCapsViewer.git")
sha1sums_x86_64=('SKIP')
depends=('vulkan-icd-loader' 'qt5-base' 'qt5-x11extras')
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
  cd $srcdir/VulkanCapsViewer
  #patch -p1 < ../fix-build.patch
}

build() {
  cd $srcdir/VulkanCapsViewer
  qmake
  make
}

package() {
  cd $srcdir/VulkanCapsViewer

  # App
  install -dm755 "${pkgdir}"/usr/bin
  install -m755 "${srcdir}"/VulkanCapsViewer/Win32/Release/vulkanCapsViewer "${pkgdir}"/usr/bin

  # Desktop shortcut
  install -Dm644 "${srcdir}"/vulkan-caps-viewer.desktop "${pkgdir}"/usr/share/applications/vulkan-caps-viewer.desktop
  install -Dm644 "${srcdir}"/VulkanCapsViewer/gfx/android_icon_256.png "${pkgdir}"/usr/share/icons/vulkan-caps-viewer.png
}
