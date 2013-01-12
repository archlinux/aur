# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=elementary-svn
pkgver=82670
pkgrel=1
pkgdesc="Enlightenment widget set"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('efl-svn') 
makedepends=('subversion')
conflicts=('elementary')
provides=('elementary')
options=('!libtool' '!emptydirs' '!strip')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/elementary"
_svnmod="elementary"

build() {
  cd "$srcdir"

  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  ./autogen.sh --prefix=/usr

  make
}

package(){  
  cd "$_svnmod-build"
  make DESTDIR="$pkgdir" install

  rm -r "$srcdir/$_svnmod-build"
}
