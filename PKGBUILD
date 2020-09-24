pkgname=stack-client
pkgver=2.6.5
pkgrel=1
pkgdesc="The STACK Client provides file sync to desktop clients."
arch=('x86_64')
url='https://www.transip.nl/stack/'
license=(GPL2)
depends=('qtkeychain' 'qt5-webengine' 'hicolor-icon-theme' 'xdg-utils' 'libcloudproviders')
optdepends=('python-nautilus: integration with Nautilus' 'nemo-python: integration with Nemo')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules' 'frameworkintegration')
conflicts=('stack-client-bin')
source=("client-v${pkgver}.tar.gz::https://github.com/nextcloud/client/archive/v${pkgver}.tar.gz"
        "http://mirror.transip.net/stack/software/source/stack-client-source-${pkgver}.20200909.tar.gz"
        "APPLICATION_NAME.patch")
sha256sums=('935385ff07174a4d85c2d4eda4d069aeb4aa8d0e68865b2cf8a24ca8cc883288'
            'b3b5e7fe98df6c8cb8e7020115e58007c902604b5928616c8fd2134dcd127e3a'
            '65a37003112bbc07bb372693793ff5a2dba86199d0da845e7203096ecc33c559')
 
prepare() {
  patch -p1 < ${srcdir}/APPLICATION_NAME.patch
  
  cd ${srcdir}
  # these seem to be already applied this time...
  #. patch.sh
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
        -DMIRALL_VERSION_SUFFIX=
  make
}
 
package() {
  cd ${srcdir}/stack-client-build
  make DESTDIR=${pkgdir} install
}
