#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=lib32-vulkan-extensionlayer-git
pkgdesc='Layer providing Vulkan features when native support is unavailable (32-bit) (git version)'
pkgver=1.3.277.r1.g419e442
pkgrel=1
arch=(i686 x86_64)
url='https://github.com/KhronosGroup/Vulkan-ExtensionLayer.git'
license=(Apache-2.0)
makedepends=(cmake python lib32-libx11 lib32-libxrandr lib32-wayland git make)
depends=(lib32-gcc-libs lib32-vulkan-icd-loader-git vulkan-headers-git lib32-vulkan-utility-libraries lib32-volk lib32-libx11)
# For the layer JSON description
depends+=(vulkan-extensionlayer-git)
### conflicts/provides/replaces: not in official archliux repos, so list a few package names that archlinnux packager can use
conflicts=(lib32-vulkan-extension-layers-git lib32-vulkan-extension-layers lib32-vulkan-extension-layer lib32-vulkan-extensionlayer lib32-vulkan-extensionlayers)
provides=(lib32-vulkan-extensionlayers lib32-vulkan-extensionlayer lib32-vulkan-extension-layer lib32-vulkan-extension-layers)
replaces=(lib32-vulkan-extension-layers-git)
options=(!lto !strip) # disable LTO (https://github.com/KhronosGroup/Vulkan-ValidationLayers/issues/5994)
source=(git+https://github.com/KhronosGroup/Vulkan-ExtensionLayer.git)

pkgver(){
  cd "${srcdir}"/Vulkan-ExtensionLayer
  git describe --long --tags --abbrev=7 --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
export CFLAGS+=" -m32"
export CXXFLAGS+=" -m32"
export LDFLAGS+=" -m32"
export ASFLAGS+=" --32"
export CFLAGS+=" -m32 -ffat-lto-objects"
export CXXFLAGS+=" -m32 -ffat-lto-objects -Wno-error=restrict"
export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  rm -rf "${srcdir}"/build

  "${srcdir}"/Vulkan-ExtensionLayer/scripts/update_deps.py --config release --arch 32

  cmake -C helper.cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-ExtensionLayer \
  -G "Unix Makefiles" \
  -D CMAKE_C_FLAGS=-m32 \
  -D CMAKE_CXX_FLAGS=-m32 \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_INSTALL_BINDIR=bin \
  -D CMAKE_INSTALL_LIBDIR=lib32 \
  -D CMAKE_INSTALL_INCLUDEDIR=include \
  -D CMAKE_INSTALL_SYSCONFDIR=/etc \
  -D CMAKE_INSTALL_DATADIR=share \
  -D VULKAN_HEADERS_INSTALL_DIR=/usr \
  -D VULKAN_UTILITY_LIBRARIES_INSTALL_DIR=/usr \
  -D VOLK_INSTALL_DIR=/usr \
  -D CMAKE_SKIP_RPATH=True \
  -D BUILD_TESTS=OFF \
  -Wno-dev

  make -j$(nproc) -C "${srcdir}"/build
}

package(){
  make -j$(nproc) -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share}

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/Vulkan-ExtensionLayer/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
