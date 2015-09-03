# Maintainer: Daniel Nagy <danielnagy at gmx de>
# $Id: PKGBUILD 166664 2012-09-15 07:49:23Z andyrtr $
# Contributor: Zauber Paracelsus <zauber@gridmail.org>

_pkgbasename=hunspell
pkgname=lib32-$_pkgbasename
pkgver=1.3.3
pkgrel=1
pkgdesc="Spell checker and morphological analyzer library and program"
arch=('x86_64')
url="http://hunspell.sourceforge.net/"
license=('GPL' 'LGPL' 'MPL')
depends=('lib32-gcc-libs' 'lib32-readline')
makedepends=(gcc-multilib)
optdepends=('perl: for ispellaff2myspell')
options=('!libtool')
source=(http://downloads.sourceforge.net/hunspell/hunspell-$pkgver.tar.gz)
md5sums=('4967da60b23413604c9e563beacc63b4')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$srcdir/hunspell-$pkgver"
  ./configure --prefix=/usr --disable-static \
	--with-ui --with-readline --with-experimental \
	--prefix=/usr --libdir=/usr/lib32 --program-suffix=-32
  make
}

package() {
  cd "$srcdir/hunspell-$pkgver"
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/usr/{include,share}  

  # add generic hunspell.so for development and projects not using pkgconfig flags - FS#30592
  pushd $pkgdir/usr/lib32
  ln -s libhunspell-?.?.so libhunspell.so
  popd
}
