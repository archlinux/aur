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
pkgrel=3
pkgdesc='High level abstract threading library'
arch=('x86_64')
url='https://www.threadingbuildingblocks.org/'
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'inetutils')
provides=("intel-tbb=$pkgver")
conflicts=('tbb' 'intel-oneapi-tbb')
source=(https://github.com/oneapi-src/oneTBB/archive/refs/tags/${_pkgmajorver}_U${_pkgminorver}.tar.gz
        'gcc12.patch')
sha512sums=('6bcc014ec90cd62293811ac436eab03c7f7c7e3e03109efcab1c42cfed48d8bf83073d03ab381e5e63ee8c905f1792a7fdab272ec7e585df14102bad714ffc15'
            '36e42247c67e44765c2d0c64e5835ff47cb4e44866d7f78664e139fdf2d71284e36ea9cd902a739bd4b5134f1731222117653b918a5a1fb4f175a468af76074d')


prepare() {
  git -C oneTBB-${_pkgmajorver}_U${_pkgminorver} apply -v "${srcdir}"/gcc12.patch
}

build() {
  cd oneTBB-${_pkgmajorver}_U${_pkgminorver}
  make
}

# check() {
#   cd oneTBB-${_pkgmajorver}_U${_pkgminorver}
#   make test
# }

package() {
  cd oneTBB-${_pkgmajorver}_U${_pkgminorver}
  install -Dm755 build/linux_*/*.so* -t "$pkgdir"/usr/lib
  install -d "$pkgdir"/usr/include
  cp -a include/tbb "$pkgdir"/usr/include
  cmake \
    -DINSTALL_DIR="$pkgdir"/usr/lib/cmake/TBB \
    -DSYSTEM_NAME=Linux \
    -DTBB_VERSION_FILE="$pkgdir"/usr/include/tbb/tbb_stddef.h \
    -P cmake/tbb_config_installer.cmake
}

