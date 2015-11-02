# Maintainer: Tobias Martin <tm-x at gmx dot net>

pkgname=tstat-svn
pkgver=775
pkgrel=1
pkgdesc="TCP STatistic and Analysis Tool"
arch=('i686' 'x86_64')
url="http://tstat.polito.it/"
license=('GPL')
depends=('libgcrypt' 'libcap' 'libpcap')
makedepends=('subversion' 'automake' 'libpcap')
options=('!emptydirs')
changelog=$pkgname.changelog
source=()

_svntrunk=http://tstat.polito.it/svn/software/tstat/trunk
_svnmod=tstat

prepare() {
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
}

build() {
  cd "$srcdir/$_svnmod-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
