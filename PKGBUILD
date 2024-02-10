#Maintainer: archdevlab <https://github.com/archdevlab>

pkgname=vulkan-extension-layers-git
pkgdesc='Layer providing Vulkan features when native support is unavailable (git version)'
pkgver=1.3.277.r1.g419e442
pkgrel=1
arch=(x86_64)
url='https://github.com/KhronosGroup/Vulkan-ExtensionLayer.git'
license=(Apache-2.0)
makedepends=(cmake python-lxml libxrandr wayland git make)
depends=(gcc-libs vulkan-icd-loader-git vulkan-headers-git vulkan-utility-libraries-git volk libx11)
provides=(vulkan-extensionlayers vulkan-extensionlayers-git)
conflicts=(vulkan-extensionlayer-git vulkan-extension-layers vulkan-extension-layers)
replaces=(vulkan-extensionlayer-git)
options=(!lto !strip) # disable LTO (https://github.com/KhronosGroup/Vulkan-ValidationLayers/issues/5994)
source=(git+https://github.com/KhronosGroup/Vulkan-ExtensionLayer.git)

pkgver(){
  cd "${srcdir}"/Vulkan-ExtensionLayer
  git describe --long --tags --abbrev=7 --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  rm -rf "${srcdir}"/build

  "${srcdir}"/Vulkan-ExtensionLayer/scripts/update_deps.py --config release

  cmake -C helper.cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-ExtensionLayer \
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
  -D VOLK_INSTALL_DIR=/usr \
  -D CMAKE_SKIP_RPATH=True \
  -D BUILD_TESTS=OFF \
  -Wno-dev

  make -j$(nproc) -C "${srcdir}"/build
}

package(){
  make -j$(nproc) -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  # install doc
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"/
  cp -r "${srcdir}"/Vulkan-ExtensionLayer/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/Vulkan-ExtensionLayer/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
