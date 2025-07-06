# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=treefrog-framework
pkgver=2.11.1
pkgrel=1
pkgdesc="High-speed C++ MVC Framework for Web Application"
arch=(x86_64)
url="https://github.com/${pkgname/-/}/${pkgname}"
license=(BSD-3-Clause)
depends=(qt5-declarative mongo-c-driver)
makedepends=(cmake qt5-tools)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d2a9fc4b7cbfa5bbbe07530c00d561705d45e05cd82220bde83d7c3fa0e4572642ebfc43c19b60a7e7db8bf5cc11225f063fadc98bd764a0381c0a43e1ec973f')

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
