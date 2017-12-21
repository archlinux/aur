pkgname=kvirc-git
pkgver=4.3.2.r7216.7ad56c988
_pkgver=4.3.2
pkgrel=1
pkgdesc="Qt5 based IRC-Client, compiled with kde5 support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL')
depends=('qt5-base' 'glibc' 'openssl' 'zlib' 'perl' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'qt5-webkit' 'phonon-qt5' 'enchant' 'kcoreaddons' 'ki18n' 'kxmlgui' 'kwindowsystem' 'knotifications' 'kservice')
makedepends=('python2' 'gettext' 'doxygen' 'extra-cmake-modules' 'zsh' 'cmake' 'git'  'gettext')
conflicts=('kvirc4' 'kvirc')
provides=('kvirc' 'kvirc4')
source=("$pkgname::git+https://github.com/kvirc/KVIrc.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
 cd "$srcdir/$pkgname"
# Fix overlinking
  sed -e '/lcrypto/d' -i CMakeLists.txt
}

build() {

  cd "$srcdir"
  rm -rf build
  mkdir build
  cd build
  cmake ../$pkgname \
  -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_QT4:BOOL="0" \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DWANT_PERL=ON \
    -DWANT_AUDIOFILE:BOOL="1" \
    -DWANT_KDE:BOOL="1" \
    -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
    -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
    -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so

  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
