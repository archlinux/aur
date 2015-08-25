# Contributor: thorsten w. <p@thorsten-wissmann.de>
pkgname=katarakt-git
pkgver=20130311
pkgrel=1
pkgdesc="A simple PDF viewer with two layouts"
arch=('i686' 'x86_64')
url="http://git.informatik.uni-erlangen.de/?p=katarakt"
license=('BSD')
depends=( qt4 poppler-qt )
optdepends=( )
makedepends=( asciidoc )
provides=( )
backup=( )
source=( )
md5sums=( )
_gitroot="git://git.informatik.uni-erlangen.de/katarakt"
_gitname="katarakt"

build() {
  cd $srcdir
  echo "Fetching source from GIT"
  if ! [ -d "$_gitname" ] ; then
    # if git dir does not exist yet
    # then clone git repo
    git clone "$_gitroot" || return 1
    cd "$_gitname"
  else
    # else pull sources
    cd "$_gitname" && git pull origin || return 1
  fi
  # compile
  qmake-qt4
  make
  a2x -f manpage -a "date=`date +%Y-%m-%d`" doc/katarakt.txt
}

package() {
  cd $srcdir/$_gitname
  install -D -m755 katarakt "${pkgdir}/usr/bin/katarakt"
  install -D -m644 doc/katarakt.txt "${pkgdir}/usr/share/doc/${pkgname}/katarakt"
  install -D -m644 doc/katarakt.1 "${pkgdir}/usr/share/man/man1/katarakt.1"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

