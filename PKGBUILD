# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from SVN sources.

# Maintainer: craven@gmx.net
pkgname=gnu-apl-svn
pkgver=917
pkgrel=1
pkgdesc="An (almost) complete implementation of ISO standard 13751"
arch=(i686 x86_64)
url="https://www.gnu.org/software/apl/"
license=('GPL3')
groups=()
depends=('ncurses' 'postgresql-libs' 'gcc-libs' 'sqlite')
makedepends=('subversion')
provides=()
conflicts=(gnu-apl)
replaces=()
backup=()
options=()
install=
source=()
noextract=()
#generate with 'makepkg -g'

_svntrunk=http://svn.savannah.gnu.org/svn/apl/trunk
_svnmod=apl

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
  CFLAGS='-std=gnu99' ./configure --prefix=/usr
  make PREFIX=/usr -j1
}

package() {
  cd "$srcdir/$_svnmod-build"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
