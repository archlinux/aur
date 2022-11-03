# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=treefrog-framework
pkgver=2.5.0
pkgrel=1
pkgdesc="High-speed C++ MVC Framework for Web Application"
arch=(x86_64)
url="https://github.com/${pkgname/-/}/${pkgname}"
license=('custom:BSD-3-clause')
depends=(qt5-declarative mongo-c-driver)
makedepends=(cmake qt5-tools)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2353db0f9cc23638f995dc522562ee8fec5800b23854af7a400c4af417348b71011ccb8c6c1a4a8053aa05510b9b9352faa4a40b356facf72ffacaa492b0e3a8')

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
