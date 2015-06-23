# Maintainer: kso <keansum AT gmail DOT com>

pkgname=freechart-svn
pkgver=r3179
pkgrel=1
pkgdesc="Free powerful charting library based on wxWidgets."
arch=('x86_64' 'i686')
url="http://wxcode.sourceforge.net/components/freechart/"
license=('custom:"wxWindows"')
depends=('wxgtk')
makedepends=('subversion')
source=('svn+http://svn.code.sf.net/p/wxcode/code/trunk/wxCode/components/freechart/')
md5sums=('SKIP')

_svnmod=freechart

pkgver() {
  cd "$_svnmod"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install

  # install LICENSE
  install -D -m644 $srcdir/$_svnmod/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
