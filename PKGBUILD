pkgname=stack-client
pkgver=2.6.2
pkgrel=1
pkgdesc="The STACK Client provides file sync to desktop clients."
arch=('x86_64')
url='https://www.transip.nl/stack/'
license=(GPL2)
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('python2-nautilus: integration with Nautilus' 'nemo-python: 
integration with Nemo')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules' 'frameworkintegration')
conflicts=('stack-client-bin')
source=("client-v${pkgver}.tar.gz::https://github.com/nextcloud/client/archive/v${pkgver}.tar.gz"
        "http://mirror.transip.net/stack/software/source/stack-client-source-${pkgver}.20200306.tar.gz"
        "APPLICATION_NAME.patch")
sha256sums=('bbcb6593134836226640b108da7ad3db061417681e2d843bc371b1d697fb0551'
            'd52cbf0ff3370e681b3275ef8004eede0563fff64563afa8de1ba53236024988'
            '65a37003112bbc07bb372693793ff5a2dba86199d0da845e7203096ecc33c559')
 
prepare() {
  patch -p1 < ${srcdir}/APPLICATION_NAME.patch
  
  cd desktop-${pkgver}
  for file in ${srcdir}/patches/*
  do
    patch -p1 < ${file}
  done
}
 
build() {
  mkdir -p stack-client-build
  cd stack-client-build
 
  cmake ../desktop-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DLINUX_PACKAGE_SHORTNAME=stack \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${pkgname} \
        -DWITH_DOC=FALSE \
        -DOEM_THEME_DIR=${srcdir}/stacktheme \
        -DNO_SHIBBOLETH=ON \
        -DQTKEYCHAIN_LIBRARY=/usr/lib/libqt5keychain.so \
        -DQTKEYCHAIN_INCLUDE_DIR=/usr/include/qt5keychain/ \
        -DAPPLICATION_EXECUTABLE=stack-client \
        -DMIRALL_VERSION_SUFFIX= \
        -DMIRALL_VERSION_BUILD=20200306
  make
}
 
package() {
  cd ${srcdir}/stack-client-build
  make DESTDIR=${pkgdir} install
}
