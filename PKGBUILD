# Maintainer: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=canorus-svn
pkgver=r1535
pkgrel=1
pkgdesc="A free music score editor"
arch=('x86_64')
url="http://www.canorus.org/"
license=('GPL')
depends=('qt5-svg' 'qt5-webengine' 'alsa-lib' 'zlib' 'python')
makedepends=('cmake' 'swig' 'qt5-tools' 'ruby' 'subversion')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")
source=('svn://svn.code.sf.net/p/canorus/code/trunk')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk"
  printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
  cd "$srcdir/trunk"
  # stringop-truncation will be fixes in swig, see https://github.com/swig/swig/issues/893
  export CXXFLAGS+=" -Wno-misleading-indentation -Wno-dangling-else -Wno-stringop-truncation -Wno-deprecated -Wno-deprecated-declarations"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
          -DDEFAULT_DATA_DIR="/usr/share/canorus"
  make
}

package() {
  cd "$srcdir/trunk"
  make install
  install -d "$pkgdir"/usr/share/{applications,pixmaps}
  cp canorus.desktop "$pkgdir"/usr/share/applications
  cp "$pkgdir"/usr/share/{canorus/images/clogosm.png,pixmaps/canorus.png}
}

# vim:set ts=2 sw=2 ft=sh et:
