# Maintainer: Arpan Kapoor <a at arpankapoor.com>
# Contributor: Thiago O. Maciel <maciel at tutanota.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Denis Martinez <deuns.martinez AT gmail.com>
# Contributor: Bogdan Burlacu <bogdan.burlacu AT pm.me>

# Based on tbb2019 AUR package

_pkgmajorver=2020
_pkgminorver=3
pkgname=tbb2020
pkgver=${_pkgmajorver}.${_pkgminorver}
pkgrel=4
pkgdesc='High level abstract threading library'
arch=('x86_64')
url='https://www.threadingbuildingblocks.org/'
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'inetutils')
provides=("tbb=$pkgver" "intel-tbb=$pkgver")
conflicts=('tbb' 'intel-oneapi-tbb')
source=(https://github.com/oneapi-src/oneTBB/archive/refs/tags/v${_pkgmajorver}.${_pkgminorver}.tar.gz)
sha512sums=('ea1ffd22c7234d715b8c46a4e51b40719c7a9b8837ab3166f1da5a2c6061167c2be2126b1d74fd361eec6975b8fce0df26829ca2e7af8029edbb52e40f23d630')

build() {
  cd oneTBB-${_pkgmajorver}.${_pkgminorver}
  make
}

package() {
  cd oneTBB-${_pkgmajorver}.${_pkgminorver}
  install -Dm755 build/linux_*/*.so* -t "$pkgdir"/usr/lib
  install -d "$pkgdir"/usr/include
  cp -a include/tbb "$pkgdir"/usr/include
  cmake \
    -DINSTALL_DIR="$pkgdir"/usr/lib/cmake/TBB \
    -DSYSTEM_NAME=Linux \
    -DTBB_VERSION_FILE="$pkgdir"/usr/include/tbb/tbb_stddef.h \
    -P cmake/tbb_config_installer.cmake
}
