# Maintainer: Lubosz Sarnecki <lubosz [at] gmail [dot] com>

pkgname=vulkan-caps-viewer-git
pkgver=4.10.r0.g628b54f
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('LGPL-3.0-or-later')
source=('vulkan-caps-viewer.desktop')
source=("git+https://github.com/SaschaWillems/VulkanCapsViewer.git"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git")
sha1sums=('SKIP' 'SKIP')
makedepends=(git)
depends=(vulkan-icd-loader qt6-base hicolor-icon-theme libxcb glibc gcc-libs)
conflicts=('vulkan-caps-viewer')
provides=('vulkan-caps-viewer')

pkgver() {
  cd $srcdir/VulkanCapsViewer
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd VulkanCapsViewer

  git submodule init
  git config submodule.Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $srcdir/VulkanCapsViewer

  local qmake_options=(
    DEFINES+=X11
    CONFIG+=release
    PREFIX=/usr
  )
  qmake6 "${qmake_options[@]}"
  make
}

package() {
  cd $srcdir/VulkanCapsViewer

  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 "${srcdir}"/VulkanCapsViewer/gfx/android_icon_256.png \
    "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
