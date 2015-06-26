# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=discretize4crf-svn
pkgver=17
pkgrel=1
pkgdesc="Discretize continuous attributes for machine learning software with the mdlpc algorithm."
arch=(i686 x86_64)
url="https://gforge.inria.fr/projects/discretize4crf/"
license=('GPL')
makedepends=('subversion' 'gcc')
source=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=svn://scm.gforge.inria.fr/svnroot/discretize4crf/
_svnmod=discretize4crf

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
  sh ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
