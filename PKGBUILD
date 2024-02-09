#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Laurent Carlier <lordheavym@gmail.com>

pkgbase=vulkan-lunarg-tools-git
pkgname=(vulkan-extra-tools-git vulkan-extra-layers-git)
pkgver=1.3.268.r58.g5ea187c
pkgrel=1
arch=(x86_64)
url='https://github.com/LunarG/VulkanTools.git'
license=(custom)
depends=()
makedepends=(git cmake python libx11 libxrandr wayland qt5-svg qt5-webengine make vulkan-headers-git vulkan-utility-libraries-git vulkan-icd-loader-git)
source=(git+https://github.com/LunarG/VulkanTools.git)

_install(){
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    mv -v "${src}" "${dir}/"
  done
}

pkgver(){
  cd "${srcdir}"/VulkanTools
  #git describe --long --tags --abbrev=7 --match='v*' | sed 's/^vulkan-sdk-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  #git describe --long --tags --abbrev=7 | sed -r 's,^[^0-9]+,,;s,([0-9]*-g),r\1,;s,[-_],.,g'
  git describe --long --tags --abbrev=7 | sed -r 's,^[^0-9]+,,;s,([0-9]*-g),r\1,;s,[-_],.,g' | sed 's/.0//g'
}

build(){
  rm -rf "${srcdir}"/{build,fakeinstall}

  "${srcdir}"/VulkanTools/scripts/update_deps.py --config release

  cmake -C helper.cmake -B "${srcdir}"/build -S "${srcdir}"/VulkanTools \
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
  -D VULKAN_LOADER_INSTALL_DIR=/usr \
  -D CMAKE_SKIP_RPATH=True \
  -D BUILD_WSI_XCB_SUPPORT=ON \
  -D BUILD_WSI_XLIB_SUPPORT=ON \
  -D BUILD_WSI_WAYLAND_SUPPORT=ON \
  -D BUILD_TESTS=OFF \
  -D BUILD_VIA=ON \
  -Wno-dev
  
  make -j$(nproc) -C "${srcdir}"/build

  make -j$(nproc) -C "${srcdir}"/build DESTDIR="${srcdir}/fakeinstall" install
}

package_vulkan-extra-tools-git(){
  pkgdesc='Vulkan lunarg tools (git version)'
  depends=(vulkan-validation-layers-git qt5-svg qt5-webengine)
  conflicts=('vulkan-trace<1.2.148.1')
  conflicts+=(vulkan-extra-tools)
  provides=(vulkan-extra-tools)

  _install fakeinstall/usr/bin/*

  # install doc
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"/
  install -m644 "${srcdir}"/VulkanTools/vkconfig/*.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/VulkanTools/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

package_vulkan-extra-layers-git(){
  pkgdesc='Extra layers for Vulkan development (git version)'
  depends=(vulkan-validation-layers-git)
  conflicts=(vulkan-extra-layers)
  provides=(vulkan-extra-layers)
  
  _install fakeinstall/usr/lib/libVkLayer_api_dump.so
  _install fakeinstall/usr/lib/libVkLayer_monitor.so
  _install fakeinstall/usr/lib/libVkLayer_screenshot.so

  _install fakeinstall/usr/share/vulkan/explicit_layer.d/VkLayer_api_dump.json
  _install fakeinstall/usr/share/vulkan/explicit_layer.d/VkLayer_monitor.json
  _install fakeinstall/usr/share/vulkan/explicit_layer.d/VkLayer_screenshot.json

  # install doc
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"/
  install -m644 "${srcdir}"/VulkanTools/layersvt/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/VulkanTools/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
