pkgname=stack-client
pkgver=2.2.4
pkgrel=1
pkgdesc="The STACK Client provides file sync to desktop clients."
arch=('x86_64')
url='https://www.transip.nl/stack/'
license=(GPL2)
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('python2-nautilus: integration with Nautilus' 'nemo-python: 
integration with Nemo')
makedepends=('cmake' 'qt5-tools')
conflicts=('stack-client-bin')
provides=('mirall-git' 'owncloud-client' 'owncloud-client-ngs')
source=("http://mirror.transip.net/stack/software/source/stackclient-${pkgver}-sources.zip"
        "SSLeay_OpenSSL.diff")
sha256sums=('65540597542b2af3f195742ffb4983cdb9030370f44482451d7a622d033ae661'
            'fd07efe4d09a086ec827e9618818a7839fae43db6192b693307977fa84842582')
 
prepare() {
  tar xzf ${pkgname}_${pkgver}.orig.tar.gz
  gunzip ${pkgname}_${pkgver}-1.1.diff.gz
  patch -p1 < SSLeay_OpenSSL.diff
}
 
build() {
  cd transipclient-${pkgver}
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/${pkgname} \
        -DWITH_DOC=FALSE \
        -DQTKEYCHAIN_LIBRARY=/usr/lib/libqt5keychain.so \
        -DQTKEYCHAIN_INCLUDE_DIR=/usr/include/qt5keychain/ \
        -DOEM_THEME_DIR=${srcdir}/transipclient-${pkgver}/transip/mirall
  make
}
 
package() {
  cd ${srcdir}/transipclient-${pkgver}
  make DESTDIR=${pkgdir} install
}
