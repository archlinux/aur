# Maintainer: Thiago O. Maciel <maciel at tutanota.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Denis Martinez <deuns.martinez AT gmail.com>
# Contributor: Bogdan Burlacu <bogdan.burlacu AT pm.me>

# Based on legacy Arch repository
# Intel's TBB (2019) is required to build Pixar's USD v22

_pkgmajorver=2019
_pkgminorver=6
pkgname=tbb2019
pkgver=${_pkgmajorver}.${_pkgminorver}
pkgrel=2
pkgdesc='High level abstract threading library'
arch=('x86_64')
url='https://www.threadingbuildingblocks.org/'
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'inetutils')
provides=("tbb=$pkgver")
conflicts=('intel-tbb' 'intel-oneapi-tbb')
source=(https://github.com/oneapi-src/oneTBB/archive/refs/tags/${_pkgmajorver}_U${_pkgminorver}.tar.gz)
sha512sums=('6bcc014ec90cd62293811ac436eab03c7f7c7e3e03109efcab1c42cfed48d8bf83073d03ab381e5e63ee8c905f1792a7fdab272ec7e585df14102bad714ffc15')

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
    -DSYSTEM_NAME=Linux \
    -DTBB_ENABLE_IPO=OFF \
    -DTBB_VERSION_FILE="$pkgdir"/usr/include/tbb/tbb_stddef.h \
    -P cmake/tbb_config_installer.cmake
}

