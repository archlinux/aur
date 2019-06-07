# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-caps-viewer
pkgver=1.92
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source=("https://github.com/SaschaWillems/VulkanCapsViewer/archive/$pkgver.tar.gz"
        'vulkan-caps-viewer.desktop')
sha1sums=('685a80eafd573a37f466149c35b4d0959f465847'
          '7ccdb4b4487b43bb428c32994092c00ca14f594a')
makedepends=(qt5-base)
depends=(vulkan-icd-loader qt5-base qt5-x11extras)

prepare() {
  if [ -d build ]
  then
    msg2 "Build dir already exist; performing an incremental build"
    msg2 "If you want to perform a clean build, please delete $(realpath build)"
    return
  fi

  mkdir build
  cd build
  export PREFIX="$pkgdir"
  qmake ../VulkanCapsViewer-$pkgver/vulkanCapsViewer.pro
}

build() {
  make -C build
}

package() {
  # App
  install -dm755 "$pkgdir"/usr/bin
  install -m755 build/Win32/Release/vulkanCapsViewer "$pkgdir"/usr/bin

  # Desktop shortcut
  install -Dm644 vulkan-caps-viewer.desktop \
    "$pkgdir"/usr/share/applications/vulkan-caps-viewer.desktop
  install -Dm644 VulkanCapsViewer-$pkgver/gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
