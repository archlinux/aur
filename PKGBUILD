#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-tools-git
pkgdesc='Vulkan Utilities and Tools (git version)'
pkgver=1.3.254.r11.g07924a8
pkgrel=1
arch=(x86_64)
url='https://github.com/KhronosGroup/Vulkan-Tools'
license=(custom)
makedepends=(cmake python vulkan-headers-git vulkan-icd-loader-git wayland-protocols glslang spirv-tools git ninja make)
depends=(libx11 wayland libvulkan.so)
conflicts=(vulkan-tools)
provides=(vulkan-tools vulkan-tools-git)
source=(git+https://github.com/KhronosGroup/Vulkan-Tools.git)
md5sums=(SKIP)

pkgver(){
 cd ${srcdir}/Vulkan-Tools

 # cutting off 'foo-' prefix that presents in the git tag
 git describe --long --tags --abbrev=7 --exclude sdk-* | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepapre(){
#  ${srcdir}/cd Vulkan-Tools
#
#  ./scripts/update_deps.py
#}

build(){
  cd ${srcdir}/Vulkan-Tools

  rm -rf build
  rm -rf build-wayland

  ./scripts/update_deps.py

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_C_FLAGS=-m64 \
  -DCMAKE_CXX_FLAGS=-m64 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_SYSCONFDIR=/etc \
  -DCMAKE_INSTALL_DATADIR=/usr/share \
  -DCMAKE_SKIP_RPATH=True \
  -DBUILD_WSI_XCB_SUPPORT=On \
  -DBUILD_WSI_XLIB_SUPPORT=On \
  -DBUILD_WSI_WAYLAND_SUPPORT=On \
  -DBUILD_CUBE=ON \
  -DBUILD_VULKANINFO=ON \
  -DBUILD_ICD=OFF \
  -DGLSLANG_INSTALL_DIR=/usr \
  -DVULKAN_HEADERS_INSTALL_DIR=/usr \
  -DVULKAN_LOADER_INSTALL_DIR=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DUSE_CCACHE=OFF

  cmake -H. -G Ninja -Bbuild-wayland \
  -DCMAKE_C_FLAGS=-m64 \
  -DCMAKE_CXX_FLAGS=-m64 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_SYSCONFDIR=/etc \
  -DCMAKE_INSTALL_DATADIR=/usr/share \
  -DCMAKE_SKIP_RPATH=True \
  -DBUILD_WSI_XCB_SUPPORT=OFF \
  -DBUILD_WSI_XLIB_SUPPORT=OFF \
  -DBUILD_WSI_WAYLAND_SUPPORT=On \
  -DBUILD_CUBE=ON \
  -DCUBE_WSI_SELECTION=WAYLAND \
  -DBUILD_VULKANINFO=OFF \
  -DBUILD_ICD=OFF \
  -DGLSLANG_INSTALL_DIR=/usr \
  -DVULKAN_HEADERS_INSTALL_DIR=/usr \
  -DVULKAN_LOADER_INSTALL_DIR=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DUSE_CCACHE=OFF

  ninja -C build/
  ninja -C build-wayland/
}

package(){
  DESTDIR="$pkgdir" ninja -C ${srcdir}/Vulkan-Tools/build/ install

  install -m755 ${srcdir}/Vulkan-Tools/build-wayland/cube/vkcube-wayland "${pkgdir}"/usr/bin/

  # install licence
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/Vulkan-Tools/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim:set ts=8 sts=2 sw=2 et:
