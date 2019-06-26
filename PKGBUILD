pkgname=stack-client
pkgver=2.4.1
pkgrel=5
pkgdesc="The STACK Client provides file sync to desktop clients."
arch=('x86_64')
url='https://www.transip.nl/stack/'
license=(GPL2)
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('python2-nautilus: integration with Nautilus' 'nemo-python: 
integration with Nemo')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules' 'frameworkintegration')
conflicts=('stack-client-bin')
source=("client-v${pkgver}.tar.gz::https://github.com/owncloud/client/archive/v${pkgver}.tar.gz"
        "http://mirror.transip.net/stack/software/source/stack-client-source-${pkgver}.tar.gz"
        "cmake_qt5.patch"
        "APPLICATION_NAME.patch")
sha256sums=('89a29ce91f49160cae4f04129a9d1e0757b665300db68d4449849c847627d337'
            '802b9032408118cff2852965f8c0ae87733205db86a8d386c2a4fb3c43e9a4d8'
            '25ab3c8010f5b031bad4b671d80487889506b43e42b3f16f2329e58bfabe5fae'
            '95f27580ce24eceae7b5b366ece4229f73104c4041dee9e42b3a46cc94625e43')
 
prepare() {
  patch -p1 < ${srcdir}/cmake_qt5.patch
  patch -p1 < ${srcdir}/APPLICATION_NAME.patch
  
  cd client-2.4.1
  for file in ${srcdir}/patches/*
  do
    patch -p1 < ${file}
  done
}
 
build() {
  mkdir -p stack-client-build
  cd stack-client-build
 
  cmake ../client-2.4.1 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DLINUX_PACKAGE_SHORTNAME=stack \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${pkgname} \
        -DWITH_DOC=FALSE \
        -DOEM_THEME_DIR=${srcdir}/transiptheme \
        -DNO_SHIBBOLETH=ON \
        -DQTKEYCHAIN_LIBRARY=/usr/lib/libqt5keychain.so \
        -DQTKEYCHAIN_INCLUDE_DIR=/usr/include/qt5keychain/ \
        -DAPPLICATION_EXECUTABLE=stack-client \
        -DMIRALL_VERSION_SUFFIX= \
        -DMIRALL_VERSION_BUILD=70896
  make
}
 
package() {
  cd ${srcdir}/stack-client-build
  make DESTDIR=${pkgdir} install
}
