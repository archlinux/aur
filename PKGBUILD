# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=cardpeek-svn
pkgver=206
pkgrel=1
pkgdesc="A tool to read the contents of smartcards"
arch=(i686 x86_64)
url="https://code.google.com/p/cardpeek/"
license=('GPL')
depends=('gtk2' 'hicolor-icon-theme' 'lua' 'pcsclite')
makedepends=('subversion')
provides=('cardpeek')
conflicts=('cardpeek')
install=cardpeek.install

_svntrunk="http://cardpeek.googlecode.com/svn/trunk"
_svnmod="cardpeek"

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
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  #./autogen.sh
  aclocal
  automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
