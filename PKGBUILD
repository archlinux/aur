# Maintainer: Benoit Favre <benoit.favre@gmail.com>
pkgname=icsiboost-svn
pkgver=172
pkgrel=1
pkgdesc="Adaboost with decision stumps, compatible with boostexter"
arch=(i686 x86_64)
url="http://code.google.com/p/icsiboost/"
license=('GPL')
depends=('pcre')
makedepends=('subversion')

_svntrunk=http://icsiboost.googlecode.com/svn/trunk/
_svnmod=icsiboost

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  cd icsiboost
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  cd icsiboost
  make DESTDIR="$pkgdir/" install
}
