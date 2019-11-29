# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-caps-viewer
pkgver=2.03
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source=("https://github.com/SaschaWillems/VulkanCapsViewer/archive/$pkgver.tar.gz")
sha1sums=('2cecf6fa42a21060171c974af607a79ad490162c')
makedepends=(qt5-base)
depends=(vulkan-icd-loader qt5-base qt5-x11extras)

#HACK: github doesn't package submodules, so we need to manually fetch the vulkan headers
makedepends+=(git)

prepare() {
  if [ -d build ]
  then
    msg2 "Build dir already exist; performing an incremental build"
    msg2 "If you want to perform a clean build, please delete $(realpath build)"
    return
  fi

  #HACK: github doesn't package submodules...
  git clone --depth 1 https://github.com/KhronosGroup/Vulkan-Headers \
    VulkanCapsViewer-$pkgver/Vulkan-Headers

  #HACK: the last commit of 2.02 explicitely breaks the build; probably wasn't intended to be pushed out
  sed 's#"/Vulkan-Headers/include"#"./Vulkan-Headers/include"#' \
    -i VulkanCapsViewer-$pkgver/vulkanCapsViewer.pro

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
