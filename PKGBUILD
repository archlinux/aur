#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-tools-git
pkgdesc='Vulkan Utilities and Tools (git version)'
pkgver=1.3.277.r1.gf24bab1
pkgrel=1
arch=(x86_64)
url='https://github.com/KhronosGroup/Vulkan-Tools'
license=(Apache-2.0)
makedepends=(cmake python vulkan-headers-git vulkan-icd-loader-git wayland-protocols glslang spirv-tools git make volk)
depends=(libx11 wayland libvulkan.so)
conflicts=(vulkan-tools)
provides=(vulkan-tools vulkan-tools-git)
source=(git+https://github.com/KhronosGroup/Vulkan-Tools.git)

pkgver(){
 cd "${srcdir}"/Vulkan-Tools
 git describe --long --tags --abbrev=7 --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  rm -rf "${srcdir}"/{build,build-wayland}

  #"${srcdir}"/Vulkan-Tools/scripts/update_deps.py --config release

  #cmake -C helper.cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-Tools \
  cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-Tools \
  -G "Unix Makefiles" \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_INSTALL_BINDIR=bin \
  -D CMAKE_INSTALL_LIBDIR=lib \
  -D CMAKE_INSTALL_INCLUDEDIR=include \
  -D CMAKE_INSTALL_SYSCONFDIR=/etc \
  -D CMAKE_INSTALL_DATADIR=share \
  -D VULKAN_HEADERS_INSTALL_DIR=/usr \
  -D VOLK_INSTALL_DIR=/usr \
  -D VULKAN_LOADER_INSTALL_DIR=/usr \
  -D CMAKE_SKIP_RPATH=True \
  -D BUILD_WSI_XCB_SUPPORT=ON \
  -D BUILD_WSI_XLIB_SUPPORT=ON \
  -D BUILD_WSI_WAYLAND_SUPPORT=ON \
  -D BUILD_CUBE=ON \
  -D BUILD_VULKANINFO=ON \
  -D BUILD_ICD=OFF \
  -Wno-dev

  #cmake -C helper.cmake -B "${srcdir}"/build-wayland -S "${srcdir}"/Vulkan-Tools \
  cmake -B "${srcdir}"/build-wayland -S "${srcdir}"/Vulkan-Tools \
  -G "Unix Makefiles" \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_INSTALL_BINDIR=bin \
  -D CMAKE_INSTALL_LIBDIR=lib \
  -D CMAKE_INSTALL_INCLUDEDIR=include \
  -D CMAKE_INSTALL_SYSCONFDIR=/etc \
  -D CMAKE_INSTALL_DATADIR=share \
  -D VULKAN_HEADERS_INSTALL_DIR=/usr \
  -D VOLK_INSTALL_DIR=/usr \
  -D VULKAN_LOADER_INSTALL_DIR=/usr \
  -D CMAKE_SKIP_RPATH=True \
  -D BUILD_WSI_XCB_SUPPORT=OFF \
  -D BUILD_WSI_XLIB_SUPPORT=OFF \
  -D BUILD_WSI_WAYLAND_SUPPORT=ON \
  -D BUILD_CUBE=ON \
  -D CUBE_WSI_SELECTION=WAYLAND \
  -D BUILD_VULKANINFO=OFF \
  -D BUILD_ICD=OFF \
  -Wno-dev

  make -j$(nproc) -C "${srcdir}"/build
  make -j$(nproc) -C "${srcdir}"/build-wayland
}

package(){
  make -j$(nproc) -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  install -m755 "${srcdir}"/build-wayland/cube/vkcube-wayland "${pkgdir}"/usr/bin/

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/Vulkan-Tools/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
