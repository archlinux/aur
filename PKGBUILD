# Maintainer: Albert Gräf <aggraef at gmail dot com?
# Contributor: Austin <doorknob60 at gmail dot com>
pkgname=libsndobj-git
pkgver=r13.780544a
pkgrel=1
pkgdesc="an object-oriented audio processing library"
arch=('i686' 'x86_64')
url="http://sndobj.sourceforge.net/"
license=('GPL')
groups=('lib')
depends=()
makedepends=('git' 'scons')
provides=('libsndobj-cvs')
conflicts=('libsndobj-cvs')
source=("$pkgname::git+git://git.code.sf.net/p/sndobj/sndobj"
	'SndPVOCEX.diff')
md5sums=('SKIP' 'bf509789b5c2c738d742d7a30ccfc8a1')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p lib  
  patch -p0 < ../SndPVOCEX.diff
}

build() {
  cd "$srcdir/$pkgname"
  scons prefix=/usr instdir="$pkgdir"
}

package() {
  cd "$srcdir/$pkgname"
  # installation assumes this even if the Python module isn't built
  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages"
  scons install
  # get rid of the bogus directory again
  rm -rf "$pkgdir/usr/lib/python2.7"
}
