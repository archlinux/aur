#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Alexandre Bouvier <contact@amb.tf>

pkgname=lib32-volk-git
pkgdesc='Meta loader for Vulkan API (32-bit) (git version)'
pkgver=1.3.275.r5.g7121910
pkgrel=1
arch=(x86_64)
url='https://github.com/zeux/volk'
license=(MIT)
depends=(vulkan-headers lib32-vulkan-icd-loader)
makedepends=(cmake git make)
conflicts=(lib32-volk)
provides=(lib32-volk)
source=(git+https://github.com/zeux/volk.git)

pkgver(){
  cd "${srcdir}"/volk
  #git describe --long --tags --abbrev=7 | sed 's/^vulkan-sdk-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  #git describe --long --tags --abbrev=7 | sed -r 's,^[^0-9]+,,;s,([0-9]*-g),r\1,;s,[-_],.,g'
  git describe --long --tags --abbrev=7 | sed -r 's,^[^0-9]+,,;s,([0-9]*-g),r\1,;s,[-_],.,g' | sed 's/.0//g'
}

build(){
export CFLAGS+=" -m32"
export CXXFLAGS+=" -m32"
export LDFLAGS+=" -m32"
export ASFLAGS+=" --32"
export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  rm -rf "${srcdir}"/build

  cmake -B "${srcdir}"/build -S "${srcdir}"/volk \
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
  -D Vulkan_INCLUDE_DIRS=/usr/include \
  -D VOLK_INSTALL=ON \
  -Wno-dev

  make -j$(nproc) -C "${srcdir}"/build
}

package(){
  make -j$(nproc) -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/include

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/volk/LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
