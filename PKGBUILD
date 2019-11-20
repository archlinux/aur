# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=dbus-cpp
pkgdesc='A header-only dbus-binding leveraging C++-11'
pkgver=5.0.0
_pkgver=5.0.0+18.04.20171031
pkgrel=5
url='https://code.launchpad.net/dbus-cpp'
arch=(x86_64)
license=(LGPL3)
depends=(process-cpp dbus libxml2)
makedepends=(cmake gmock properties-cpp boost lcov gcovr)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/dbus-cpp_${_pkgver}.orig.tar.gz"
        'boost-asio-1-66.patch')
sha256sums=('e0d426027acd65f7e568c53e974ae3e666f0af2e75b2d2afed3dae721a6e9e38'
            '7e7b83516ddbcad675ed63dc950ecdd35cecf73efad63fac675931e4b3795269')

prepare() {
  cd "${srcdir}"

  # Don't build tests
  truncate -s 0 tests/CMakeLists.txt

  # Fix boost asio 1.66 API changes
  # https://github.com/anbox/anbox/issues/637#issuecomment-373361974
  patch -Np1 -i boost-asio-1-66.patch
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  CXXFLAGS=-Wno-error=deprecated-copy cmake .. -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DDBUS_CPP_VERSION_MAJOR=5 -DDBUS_CPP_VERSION_MINOR=0 -DDBUS_CPP_VERSION_PATCH=0
  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
