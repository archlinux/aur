pkgname=stack-client
pkgver=2.6.4
pkgrel=2
pkgdesc="The STACK Client provides file sync to desktop clients."
arch=('x86_64')
url='https://www.transip.nl/stack/'
license=(GPL2)
depends=('qtkeychain' 'qt5-webengine' 'hicolor-icon-theme' 'xdg-utils' 'libcloudproviders')
optdepends=('python-nautilus: integration with Nautilus' 'nemo-python: integration with Nemo')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules' 'frameworkintegration')
conflicts=('stack-client-bin')
source=("client-v${pkgver}.tar.gz::https://github.com/nextcloud/client/archive/v${pkgver}.tar.gz"
        "http://mirror.transip.net/stack/software/source/stack-client-source-${pkgver}.20200506.tar.gz"
        "APPLICATION_NAME.patch"
        "qt5.15_missing_qpainterpath_include.patch")
sha256sums=('aea4dff6bf2a6bd2b783a6175ac2393ffcae2949536b15def7aae4372f0c24ef'
            'b6dc38ad1830b3b1b99863c853117bd03198bf0c15ecbe06da30b644c5c8f14d'
            '65a37003112bbc07bb372693793ff5a2dba86199d0da845e7203096ecc33c559'
            '449c798e17b9e6bea8ab0021383a9c97422e28bebae1db0166fab3f8971e4fc0')
 
prepare() {
  patch -p1 < ${srcdir}/APPLICATION_NAME.patch
  patch -p1 < ${srcdir}/qt5.15_missing_qpainterpath_include.patch
  
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
        -DMIRALL_VERSION_BUILD=20200508
  make
}
 
package() {
  cd ${srcdir}/stack-client-build
  make DESTDIR=${pkgdir} install
}
