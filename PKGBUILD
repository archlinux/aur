# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-caps-viewer
pkgver=2.03
pkgrel=2
pkgdesc='Vulkan Hardware Capability Viewer'
url='http://vulkan.gpuinfo.org/'
arch=('x86_64')
license=('GPL2')
source=("git+https://github.com/SaschaWillems/VulkanCapsViewer#tag=$pkgver"
        "git+https://github.com/KhronosGroup/Vulkan-Headers")
sha1sums=('SKIP'
          'SKIP')
makedepends=(git qt5-base)
depends=(vulkan-icd-loader qt5-base qt5-x11extras)

prepare() {
  if [ -d build ]
  then
    msg2 "Build dir already exist; performing an incremental build"
    msg2 "If you want to perform a clean build, please delete $(realpath build)"
    return
  fi

  git -C VulkanCapsViewer submodule init
  git -C VulkanCapsViewer config submodule.Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git -C VulkanCapsViewer submodule update

  #HACK: the last commit of 2.02 explicitely breaks the build; probably wasn't intended to be pushed out
  sed 's#"/Vulkan-Headers/include"#"./Vulkan-Headers/include"#' \
    -i VulkanCapsViewer/vulkanCapsViewer.pro

  mkdir build
  cd build
  export PREFIX="$pkgdir"
  qmake \
    QMAKE_CFLAGS="$CFLAGS" \
    QMAKE_CXXFLAGS="$CXXFLAGS" \
    QMAKE_LFLAGS="$LDFLAGS" \
    PREFIX=/usr \
    ../VulkanCapsViewer
}

build() {
  make -C build
}

package() {
  make -C build INSTALL_ROOT="$pkgdir" install

  # There's a bug preventing this from being installed automatically
  install -Dm644 VulkanCapsViewer/gfx/android_icon_256.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
}
