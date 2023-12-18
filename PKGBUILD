# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=treefrog-framework
pkgver=2.8.0
pkgrel=1
pkgdesc="High-speed C++ MVC Framework for Web Application"
arch=(x86_64)
url="https://github.com/${pkgname/-/}/${pkgname}"
license=('custom:BSD-3-clause')
depends=(qt5-declarative mongo-c-driver)
makedepends=(cmake qt5-tools)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('742f4a7579f6130b1822a940084ff1543286d91267295c454d44828e150b591f719daf478992d917c2b246dd0d181f026424a1117e0def458d4a84ac27465120')

prepare() {
  cd ${pkgname}-${pkgver}
  rm -r 3rdparty

  sed -i 's|INCLUDEPATH += ../include ../3rdparty/lz4/lib|INCLUDEPATH += ../include|' src/corelib.pro

  sed -i 's|LIBS += ../3rdparty/lz4/lib/liblz4.a|LIBS += -llz4|' src/corelib.pro

  sed -i 's|INCLUDEPATH += ../3rdparty/mongo-driver/src/libmongoc/src/mongoc ../3rdparty/mongo-driver/src/libbson/src|INCLUDEPATH += /usr/include/libmongoc-1.0 /usr/include/libbson-1.0|' src/corelib.pro

  sed -i 's|LIBS += ../3rdparty/mongo-driver/src/libmongoc/libmongoc-static-1.0.a ../3rdparty/mongo-driver/src/libbson/libbson-static-1.0.a|LIBS += -lmongoc-1.0 -lbson-1.0|' src/corelib.pro

  sed -i 's|exit $RET||' configure
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr

  cd src
  make
}

package() {
  cd ${pkgname}-${pkgver}/src
  make INSTALL_ROOT="${pkgdir}" install

  install -Dm644 ../copyright "${pkgdir}"/usr/share/licenses/${pkgname}/copyright
}
