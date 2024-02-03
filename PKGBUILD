#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-vulkan-icd-loader-git
pkgdesc='Vulkan Installable Client Driver (ICD) Loader (32-bit) (git version)'
pkgver=1.3.275
pkgrel=1
arch=(i686 x86_64)
url='https://github.com/KhronosGroup/Vulkan-Loader'
license=(Apache-2.0)
makedepends=(cmake python lib32-libx11 lib32-libxrandr lib32-wayland vulkan-headers-git git make)
depends=(lib32-glibc)
optdepends=('lib32-vulkan-driver: packaged vulkan driver')
conflicts=(lib32-vulkan-icd-loader)
provides=(lib32-vulkan-icd-loader libvulkan.so lib32-vulkan-icd-loader-git)
source=(git+https://github.com/KhronosGroup/Vulkan-Loader.git)

pkgver(){
 cd "${srcdir}"/Vulkan-Loader
 git describe --long --tags --abbrev=7 --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
export CFLAGS+=" -m32"
export CXXFLAGS+=" -m32"
export LDFLAGS+=" -m32"
export ASFLAGS+=" --32"
export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  rm -rf "${srcdir}"/build

  cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-Loader \
  -D CMAKE_C_FLAGS=-m32 \
  -D CMAKE_CXX_FLAGS=-m32 \
  -G "Unix Makefiles" \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_INSTALL_BINDIR=bin \
  -D CMAKE_INSTALL_LIBDIR=lib32 \
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

  make -j$(nproc) -C "${srcdir}"/build
}

package(){
  make -j$(nproc) -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/Vulkan-Loader/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
