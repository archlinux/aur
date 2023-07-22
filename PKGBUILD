# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Thiago O. Maciel <maciel at tutanota.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Denis Martinez <deuns.martinez AT gmail.com>
# Contributor: Bogdan Burlacu <bogdan.burlacu AT pm.me>

pkgname=onetbb-2019
pkgver=2019_U6
pkgrel=1
pkgdesc="High level abstract threading library (oneAPI Threading Building Blocks)"
arch=(x86_64)
url="https://oneapi-src.github.io/oneTBB/"
license=(Apache)
depends=(glibc gcc-libs)
makedepends=(cmake) #'inetutils'
source=("onetbb-${pkgver}.tar.gz::https://github.com/oneapi-src/oneTBB/archive/refs/tags/${pkgver}.tar.gz"
        'onetbb-2019-gcc12.patch'
        'onetbb-2019-gcc13.patch')
sha512sums=('6bcc014ec90cd62293811ac436eab03c7f7c7e3e03109efcab1c42cfed48d8bf83073d03ab381e5e63ee8c905f1792a7fdab272ec7e585df14102bad714ffc15'
            '36e42247c67e44765c2d0c64e5835ff47cb4e44866d7f78664e139fdf2d71284e36ea9cd902a739bd4b5134f1731222117653b918a5a1fb4f175a468af76074d'
            'e9d4d37b6243b32dc4dbf1ab8b5b1c6a2ceb87a81b7ac711afd95244131ac5305e2369b93581c4670ca15f8cdc42482a8cd373e22779322d52e66e2a5ecdf08b')

prepare() {
  cd "oneTBB-${pkgver}"
  patch -Np1 -i ../onetbb-2019-gcc12.patch
  patch -Np1 -i ../onetbb-2019-gcc13.patch
}

build() {
  cd "oneTBB-${pkgver}"
  make
}

package() {
  cd "oneTBB-${pkgver}"
  install -Dm755 build/linux_*/*.so* -t "$pkgdir"/opt/tbb2019/lib
  install -d "$pkgdir"/opt/tbb2019/include
  cp -a include/tbb "$pkgdir"/opt/tbb2019/include
  cmake \
    -DINSTALL_DIR="$pkgdir"/opt/tbb2019/cmake \
    -DSYSTEM_NAME=Linux \
    -DTBB_VERSION_FILE="$pkgdir"/opt/tbb2019/include/tbb/tbb_stddef.h \
    -P cmake/tbb_config_installer.cmake
}

