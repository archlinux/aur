#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-vulkan-validation-layers-git
pkgdesc='Vulkan Validation Layers (32-bit) (git version)'
pkgver=1.3.292.r19.gd8bbb73
pkgrel=1
arch=(i686 x86_64)
url='https://github.com/KhronosGroup/Vulkan-ValidationLayers'
license=(custom)
makedepends=(cmake python lib32-libxrandr lib32-wayland git ninja make)
depends=(lib32-gcc-libs lib32-vulkan-icd-loader vulkan-headers vulkan-utility-libraries lib32-vulkan-utility-libraries lib32-libx11)
# For the layer JSON description
depends+=(vulkan-validation-layers)
conflicts=(lib32-vulkan-validation-layers)
provides=(lib32-vulkan-validation-layers lib32-vulkan-validation-layers-git libVkLayer_khronos_validation.so)
options=(!lto !strip) # disable LTO (https://github.com/KhronosGroup/Vulkan-ValidationLayers/issues/5994)
source=(git+https://github.com/KhronosGroup/Vulkan-ValidationLayers.git)

pkgver(){
  cd "${srcdir}"/Vulkan-ValidationLayers
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

  "${srcdir}"/Vulkan-ValidationLayers/scripts/update_deps.py --config release --generator Ninja --arch 32

  cmake -C helper.cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-ValidationLayers \
  -G Ninja \
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
  -D CMAKE_SKIP_RPATH=True \
  -D BUILD_TESTS=OFF \
  -D BUILD_WSI_XCB_SUPPORT=ON \
  -D BUILD_WSI_XLIB_SUPPORT=ON \
  -D BUILD_WSI_WAYLAND_SUPPORT=ON \
  -D USE_ROBIN_HOOD_HASHING=OFF \
  -Wno-dev

  ninja -j$(nproc) -C "${srcdir}"/build
}

package(){
  DESTDIR="${pkgdir}" ninja -j$(nproc) -C "${srcdir}"/build install

  rm -rf "${pkgdir}"/usr/{include,share}

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/Vulkan-ValidationLayers/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
