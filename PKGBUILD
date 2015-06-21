pkgname=bist-svn
pkgver=161
pkgrel=1
pkgdesc="A chemical drawing tool"
arch=('i686' 'x86_64')
url="http://gna.org/projects/bist/"
license=('GPL3')
depends=('curl' 'fltk>=1.3' 'gsl' 'expat' 'openbabel>=2.0' 'cairo' 'pango')
provides=('bist')
conflicts=('bist')


_svntrunk='svn://svn.gna.org/svn/bist/trunk'
_svnmod='bist'

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

  #
  # BUILD HERE
  #
  autoreconf -fiv
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
