# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: fancris3 <fancris3 at aol.com>

pkgname=e17-places-svn
pkgver=82790
pkgrel=1
pkgdesc="Enlightenment e17 module: Manage the mounting of volumes"
arch=('i686' 'x86_64')
url="http://code.google.com/p/e17mods/wiki/Places"
license=('BSD')
depends=('enlightenment17' 'e_dbus')
makedepends=('subversion')
provides=('e17-places')
options=('!libtool')

_svntrunk=http://svn.enlightenment.org/svn/e/trunk/E-MODULES-EXTRA/places
_svnmod=places

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

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install

# install license files
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  rm -r "$srcdir/$_svnmod-build"
}
