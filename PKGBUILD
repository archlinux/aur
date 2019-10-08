# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-caps-viewer
pkgver=2.02
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source=("https://github.com/SaschaWillems/VulkanCapsViewer/archive/$pkgver.tar.gz")
sha1sums=('bd4edf5510968bd5c9c2bce0deb4c048b7ddf966')
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
  qmake \
    QMAKE_CFLAGS="$CFLAGS" \
    QMAKE_CXXFLAGS="$CXXFLAGS" \
    QMAKE_LFLAGS="$LDFLAGS" \
    PREFIX=/usr \
    ../VulkanCapsViewer-$pkgver
}

build() {
  make -C build
}

package() {
  make -C build INSTALL_ROOT="$pkgdir" install

  # There's a bug preventing this from being installed automatically
  install -Dm644 VulkanCapsViewer-$pkgver/gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
