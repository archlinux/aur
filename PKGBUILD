#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Laurent Carlier <lordheavym@gmail.com>
#Credits: Bartosz Taudul <wolf@nereid.pl>

pkgname=vulkan-utility-libraries-git
pkgdesc='Vulkan Utility Libraries (git version)'
pkgver=1.3.277.r0.g86de0a0
pkgrel=1
arch=(x86_64)
url='https://github.com/KhronosGroup/Vulkan-Utility-Libraries'
license=(Apache-2.0)
depends=(libvulkan.so)
makedepends=(cmake python vulkan-headers-git)
conflicts=(vulkan-utility-libraries)
provides=(vulkan-utility-libraries)
source=(git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git)

pkgver(){
  cd "${srcdir}"/Vulkan-Utility-Libraries
  git describe --long --tags --abbrev=7 --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  rm -rf "${srcdir}"/build

  cmake -B "${srcdir}"/build -S "${srcdir}"/Vulkan-Utility-Libraries \
  -G "Unix Makefiles" \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_INSTALL_BINDIR=bin \
  -D CMAKE_INSTALL_LIBDIR=lib \
  -D CMAKE_INSTALL_INCLUDEDIR=include \
  -D CMAKE_INSTALL_SYSCONFDIR=/etc \
  -D CMAKE_INSTALL_DATADIR=share \
  -Wno-dev

  make -j$(nproc) -C "${srcdir}"/build
}

package(){
  make -j$(nproc) -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/Vulkan-Utility-Libraries/LICENSES/* "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
