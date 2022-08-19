# Maintainer: Thiago O. Maciel <maciel at tutanota.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Denis Martinez <deuns.martinez AT gmail.com>
# Contributor: Bogdan Burlacu <bogdan.burlacu AT pm.me>

# Based on legacy Arch repository
# Intel's TBB (2019) is required to build Pixar's USD v22

_pkgmajorver=2019
_pkgminorver=9
pkgname=tbb2019
pkgver=${_pkgmajorver}.${_pkgminorver}
pkgrel=1
pkgdesc='High level abstract threading library'
arch=('x86_64')
url='https://www.threadingbuildingblocks.org/'
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'inetutils')
provides=("tbb=$pkgver")
conflicts=('intel-tbb' 'intel-oneapi-tbb')
source=(https://github.com/oneapi-src/oneTBB/archive/refs/tags/${_pkgmajorver}_U${_pkgminorver}.tar.gz)
sha512sums=('ac1710ddfccfc431ffee2b9083b0892ee51b51929fe4de6444587c470d5274e22b265a63a4ea6c84471214aae42ec5c9f13c6512d33ef0d915e6235279b8f61e')

build() {
  cd oneTBB-${_pkgmajorver}_U${_pkgminorver}
  make
}

package() {
  cd oneTBB-${_pkgmajorver}_U${_pkgminorver}
  install -Dm755 build/linux_*/*.so* -t "$pkgdir"/usr/lib
  install -d "$pkgdir"/usr/include
  cp -a include/tbb "$pkgdir"/usr/include
  cmake \
    -DINSTALL_DIR="$pkgdir"/usr/lib/cmake/TBB \
    -DSYSTEM_NAME=Linux -DTBB_VERSION_FILE="$pkgdir"/usr/include/tbb/tbb_stddef.h \
    -P cmake/tbb_config_installer.cmake
}

