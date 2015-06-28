# Maintainer: serkho <sergey.khorev@gmail.com>
# adopted from reduce-algebra by quasi <quasi@aur.archlinux.org>

pkgname=reduce-algebra-svn
pkgver=20130708
pkgrel=1
pkgdesc="A portable general-purpose computer algebra system"
arch=('i686' 'x86_64')
url="http://reduce-algebra.sourceforge.net/"
license=('BSD')
groups=('science')
makedepends=('subversion' 'texlive-htmlxml' 'imagemagick') # for documentation
depends=('ncurses' 'libxext' 'libxrandr' 'libxft' 'freetype2' 'expat' 'libx11' 'libxcursor')
source=('reduce.desktop' 'reduce' 'csl')
md5sums=('fe457bdd9feec1bbc86b9128fce723ec' '62cf22ea23b900a28c344105cc6639ca' '6c1ad93314ba801b657b75db450eb324')
conflicts=('reduce-algebra')

_svntrunk="http://svn.code.sf.net/p/reduce-algebra/code/trunk"
_svnmod="reduce-algebra"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up)
  else
    svn co "$_svntrunk" --config-dir ./ "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

  cd "$srcdir/$_svnmod-build"
  ./configure --with-csl && make -j1
  msg "Making documentation"
  (cd doc/misc && make -j1)
  (cd doc/manual && make -j1)
  # TODO build documentation in manual2
}

package(){
  install -D -m644 reduce.desktop $pkgdir/usr/share/applications/reduce.desktop
  install -D reduce $pkgdir/usr/bin/reduce
  install -D csl $pkgdir/usr/bin/csl

  cd "$srcdir/$_svnmod-build"
  install -D -m644 cslbuild/generated-c/reduce.img $pkgdir/opt/reduce-algebra/reduce.img
  install -D -m644 cslbuild/generated-c/csl.img $pkgdir/opt/reduce-algebra/csl.img
  cp -r cslbuild/$CARCH-unknown-linux-gnu/csl/reduce.doc $pkgdir/opt/reduce-algebra
  cp -r cslbuild/$CARCH-unknown-linux-gnu/csl/reduce.fonts $pkgdir/opt/reduce-algebra
  install -t $pkgdir/opt/reduce-algebra cslbuild/$CARCH-unknown-linux-gnu/csl/reduce cslbuild/$CARCH-unknown-linux-gnu/csl/csl
  install -m644 -t $pkgdir/opt/reduce-algebra/reduce.doc doc/misc/sl.pdf doc/util/r38.pdf doc/manual/manual.pdf
  install -D -m644 generic/qreduce/Bumblebee.png $pkgdir/usr/share/icons/reduce-algebra.png
}

# vim:set ts=2 sw=2 et:
