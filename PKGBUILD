# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-ocl
_pkgname=orocos-toolchain
pkgver=2.6.0
pkgrel=2
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (Orocos Component Library)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
depends=('orocos-rtt' 'orocos-log4cpp' 'lua51')
makedepends=('cmake')
source=(http://people.mech.kuleuven.be/~orocos/pub/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('ac68f90da0d7c4595e5d78687d68ab2f')
sha256sums=('d98adaf4975ffef6b79b7d31f16c488014e347afbc5549910f209db4a9f469fd')
sha384sums=('6fc673dd6a5f034b21f87b2171f6303077a5759cdcc7c9dd745e44b1a51a7a5a4028455c6588b24556d2d3907dd5b372')
sha512sums=('7d30ac8bb751c489302cb15c8a613345aabb2023c935c04f371bb35b52faabd9563e20da384fbe409a7f4533c133eea983484800680d22737be95b37653a6be9')

build() {
  # build ocl
  cd "${srcdir}/${_pkgname}-${pkgver}/ocl"

  sed 's#usr/share#share#g' -i lua/CMakeLists.txt

  # this is a bit hacky: finding the orocos version of log4cpp with cmake does
  # not work so we need to provide the complete information from here
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DLOG4CPP_INCLUDE_DIR=/usr/include/orocos \
    -DLOG4CPP_LIBRARIES=orocos-log4cpp \
    -DLOG4CPP_LIBRARY_DIRS=/usr/lib \
    -DLOG4CPP_LIBRARY=/usr/lib/liborocos-log4cpp.so \
    -DLUA_INCLUDE_DIR=/usr/include/lua5.1/ .

  make
}

package() {
  # install ocl
  cd "${srcdir}/${_pkgname}-${pkgver}/ocl"
  make DESTDIR=${pkgdir} install
}

