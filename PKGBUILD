# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=qt5ct-svn
pkgver=0.37.r508
pkgrel=1
pkgdesc="Qt5 Configuration Tool - svn version."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/qt5ct/"
license=('BSD')
depends=('qt5-svg')
makedepends=('qt5-tools' 'subversion')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
install=${pkgname%-*}.install
source=('qt5ct::svn://svn.code.sf.net/p/qt5ct/code/trunk/qt5ct')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  major=$(grep 'define QT5CT_VERSION_MAJOR' src/qt5ct/qt5ct.h | awk '{print $3}')
  minor=$(grep 'define QT5CT_VERSION_MINOR' src/qt5ct/qt5ct.h | awk '{print $3}')
  local ver="$(svnversion)"
  printf "%s.r%s" "$major"."$minor" "${ver//[[:alpha:]]}"
}

build() {
  cd "${pkgname%-*}"
  qmake-qt5 PREFIX=/usr qt5ct.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd "${pkgname%-*}"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
