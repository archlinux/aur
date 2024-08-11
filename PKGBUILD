#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vulkan-extension-layers-git
pkgdesc='Layer providing Vulkan features when native support is unavailable (git version)'
pkgver=1.3.290.r4.g7aa7f45
pkgrel=1
arch=(x86_64)
url='https://github.com/KhronosGroup/Vulkan-ExtensionLayer.git'
license=(Apache-2.0)
makedepends=(cmake python-lxml libxrandr wayland git ninja make)
depends=(gcc-libs vulkan-icd-loader vulkan-headers vulkan-utility-libraries volk libx11)
### conflicts/provides/replaces: not in official archliux repos, so list a few package names that archlinnux packager can use
conflicts=(vulkan-extensionlayer-git vulkan-extension-layers vulkan-extension-layer vulkan-extensionlayer vulkan-extensionlayers)
provides=(vulkan-extensionlayers vulkan-extensionlayer vulkan-extension-layer vulkan-extension-layers)
replaces=(vulkan-extensionlayer-git)
options=(!lto !strip) # disable LTO (https://github.com/KhronosGroup/Vulkan-ValidationLayers/issues/5994)
source=(git+https://github.com/KhronosGroup/Vulkan-ExtensionLayer.git)

pkgver(){
  cd "${srcdir}"/Vulkan-ExtensionLayer
  git describe --long --tags --abbrev=7 --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  rm -rf "${srcdir}"/build

  "${srcdir}"/Vulkan-ExtensionLayer/scripts/update_deps.py --config release --generator Ninja

  cmake -C helper.cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-ExtensionLayer \
  -G Ninja \
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

  ninja -j$(nproc) -C "${srcdir}"/build
}

package(){
  DESTDIR="${pkgdir}" ninja -j$(nproc) -C "${srcdir}"/build install

  # install doc
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"/
  cp -r "${srcdir}"/Vulkan-ExtensionLayer/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/Vulkan-ExtensionLayer/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
