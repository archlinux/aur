#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-icd-loader-git
pkgdesc='Vulkan Installable Client Driver (ICD) Loader (git version)'
pkgver=1.3.292.r0.gfaeb588
pkgrel=1
arch=(x86_64)
url='https://github.com/KhronosGroup/Vulkan-Loader'
license=(Apache-2.0)
makedepends=(cmake python-lxml libx11 libxrandr wayland vulkan-headers git ninja make)
depends=(glibc)
optdepends=('vulkan-driver: packaged vulkan driver')
conflicts=(vulkan-icd-loader)
provides=(vulkan-icd-loader libvulkan.so vulkan-icd-loader-git)
source=(git+https://github.com/KhronosGroup/Vulkan-Loader.git)

pkgver(){
 cd "${srcdir}"/Vulkan-Loader
 git describe --long --tags --abbrev=7 --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  rm -rf "${srcdir}"/build

  cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-Loader \
  -G Ninja \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_INSTALL_BINDIR=bin \
  -D CMAKE_INSTALL_LIBDIR=lib \
  -D CMAKE_INSTALL_INCLUDEDIR=include \
  -D CMAKE_INSTALL_SYSCONFDIR=/etc \
  -D CMAKE_INSTALL_DATADIR=share \
  -D VULKAN_HEADERS_INSTALL_DIR=/usr \
  -D CMAKE_SKIP_RPATH=True \
  -D BUILD_TESTS=OFF \
  -D BUILD_WSI_XCB_SUPPORT=ON \
  -D BUILD_WSI_XLIB_SUPPORT=ON \
  -D BUILD_WSI_WAYLAND_SUPPORT=ON \
  -D BUILD_WSI_DIRECTFB_SUPPORT=OFF \
  -Wno-dev

  ninja -j$(nproc) -C "${srcdir}"/build
}

package(){
  DESTDIR="${pkgdir}" ninja -j$(nproc) -C "${srcdir}"/build install

  # install doc
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"/
  cp -r "${srcdir}"/Vulkan-Loader/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/Vulkan-Loader/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
