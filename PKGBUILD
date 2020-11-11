pkgname=mingw-w64-vulkan-caps-viewer
pkgver=2.21
pkgrel=1
pkgdesc='Vulkan Hardware Capability Viewer (mingw-w64)'
url='http://vulkan.gpuinfo.org/'
arch=('any')
license=('GPL2')
source=("git+https://github.com/SaschaWillems/VulkanCapsViewer#tag=$pkgver"
        "git+https://github.com/KhronosGroup/Vulkan-Headers")
sha1sums=('SKIP'
          'SKIP')
makedepends=(git)
depends=('mingw-w64-qt5-base' 'mingw-w64-vulkan-icd-loader')
makedepends=('mingw-w64-gcc')
options=('staticlibs' '!strip' '!buildflags')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd VulkanCapsViewer

  git submodule init
  git config submodule.Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git submodule update

  sed -i "s|Windows.h|windows.h|g" vulkancapsviewer.cpp
  sed -i "s|Advapi32.lib|-ladvapi32|g" vulkanCapsViewer.pro
  sed -i 's|"\$\$PWD/libs/vulkan/vulkan-1.lib"|-lvulkan-1|g' vulkanCapsViewer.pro
}

build() {
  for _arch in ${_architectures}; do
    export QTDIR=/usr/${_arch}/lib/qt
    export PATH=${QTDIR}/bin:${PATH}
    rm -rf VulkanCapsViewer-build-${_arch}
    cp -r VulkanCapsViewer VulkanCapsViewer-build-${_arch}
    pushd VulkanCapsViewer-build-${_arch}
    qmake \
      QMAKE_CFLAGS="$CFLAGS" \
      QMAKE_CXXFLAGS="$CXXFLAGS" \
      QMAKE_LFLAGS="$LDFLAGS" \
      PREFIX=/usr/${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/VulkanCapsViewer-build-${_arch}"
    install -d "$pkgdir"/usr/${_arch}/bin
    install -m 755 Win32/Release/vulkanCapsViewer.exe "$pkgdir"/usr/${_arch}/bin
    install -Dm644 gfx/android_icon_256.png \
      "$pkgdir"/usr/${_arch}/share/icons/hicolor/256x256/apps/vulkanCapsViewer.png
  done
}
