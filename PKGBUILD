pkgname=kvirc-git
pkgver=5.0.0.beta1.r81.g85ef2059c
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
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
    -DWANT_QT4=OFF \
    -DCMAKE_BUILD_TYPE="Release" \
    -DWANT_PERL=ON \
    -DWANT_AUDIOFILE=ON \
    -DWANT_KDE=ON \
    -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
    -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
    -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so

  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
