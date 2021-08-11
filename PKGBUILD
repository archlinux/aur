# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Diego Sogari <diego.sogari@falker.com.br>

pkgname=nanodbc
pkgver=2.13.0
pkgrel=3
pkgdesc="A small C++ wrapper for the native C ODBC API"
arch=('i686' 'x86_64')
url="http://nanodbc.io/"
license=('MIT')
depends=('unixodbc')
makedepends=('gcc' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz"::https://github.com/nanodbc/nanodbc/archive/v${pkgver}.tar.gz)
sha256sums=('174080f1cab25b1d7fe5a8e2862f4e730a1c7c1732b7bc54132ade832ef1a07c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i '28 i #include <limits>' nanodbc/nanodbc.cpp
}

build() {
  rm -rf "${srcdir}/build" "${srcdir}/build-static"
  mkdir "${srcdir}/build" "${srcdir}/build-static"

  cd "${srcdir}/build-static"

  cmake \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DNANODBC_DISABLE_LIBCXX=ON \
    -DNANODBC_DISABLE_TESTS=ON \
    "../${pkgname}-${pkgver}"

  make

  cd "${srcdir}/build"

  cmake \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DNANODBC_DISABLE_LIBCXX=ON \
    -DNANODBC_DISABLE_TESTS=ON \
    "../${pkgname}-${pkgver}"

  make
}

# TODO
#check() {
#}

package() {
  cd "${srcdir}/build-static"
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
