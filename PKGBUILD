#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Laurent Carlier <lordheavym@gmail.com>
#Credits: Bartosz Taudul <wolf@nereid.pl>

pkgname=lib32-vulkan-utility-libraries-git
pkgdesc='Vulkan Utility Libraries (32-bit) (git version)'
pkgver=1.3.275
pkgrel=1
arch=(x86_64)
url='https://github.com/KhronosGroup/Vulkan-Utility-Libraries'
license=(Apache)
depends=(libvulkan.so)
makedepends=(cmake python vulkan-headers-git)
conflicts=(lib32-vulkan-utility-libraries)
provides=(lib32-vulkan-utility-libraries)
source=(git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git)

pkgver(){
  cd "${srcdir}"/Vulkan-Utility-Libraries
  git describe --long --tags --abbrev=7 --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
export CFLAGS+=" -m32"
export CXXFLAGS+=" -m32"
export LDFLAGS+=" -m32"
export ASFLAGS+=" --32"
export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  rm -rf "${srcdir}"/build

  cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-Utility-Libraries \
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
  -Wno-dev

  make -j$(nproc) -C "${srcdir}"/build
}

package(){
  make -j$(nproc) -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/include
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
