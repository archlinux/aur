#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-validation-layers-git
pkgdesc='Vulkan Validation Layers (git version)'
pkgver=1.3.275
pkgrel=1
arch=(x86_64)
url='https://github.com/KhronosGroup/Vulkan-ValidationLayers'
license=(Apache-2.0)
makedepends=(cmake python-lxml libxrandr wayland git make)
depends=(gcc-libs vulkan-icd-loader-git vulkan-headers-git vulkan-utility-libraries-git libx11)
conflicts=(vulkan-validation-layers)
provides=(vulkan-validation-layers vulkan-validation-layers-git libVkLayer_khronos_validation.so)
options=(!lto !strip) # disable LTO (https://github.com/KhronosGroup/Vulkan-ValidationLayers/issues/5994)
source=(git+https://github.com/KhronosGroup/Vulkan-ValidationLayers.git)

pkgver(){
  cd "${srcdir}"/Vulkan-ValidationLayers
  git describe --long --tags --abbrev=7 --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  rm -rf "${srcdir}"/build

  "${srcdir}"/Vulkan-ValidationLayers/scripts/update_deps.py --config release

  cmake -C helper.cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-ValidationLayers \
  -G "Unix Makefiles" \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_INSTALL_BINDIR=bin \
  -D CMAKE_INSTALL_LIBDIR=lib \
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

  make -j$(nproc) -C "${srcdir}"/build
}

package(){
  make -j$(nproc) -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  # install doc
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"/
  cp -r "${srcdir}"/Vulkan-ValidationLayers/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/Vulkan-ValidationLayers/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
