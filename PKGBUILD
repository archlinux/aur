# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Arch_CVS_&_SVN_PKGBUILD_guidelines
# for more information on packaging from SVN sources.

# Contributor: Rene Reigel <stormtrooperofdeath@gmx.net>
pkgname=aesthe-svn
pkgver=164
pkgrel=1
pkgdesc="3d modeller"
arch=('i686')
url="http://sourceforge.net/projects/aesthe/"
license=('unknown')
groups=()
depends=('lua' 'sdl')
makedepends=('subversion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(Makefile Makefile2)
noextract=()
md5sums=('6d79159605fd7081c3ab844954238977'
         '2bb71fb2103af5a039ae8c6f1a6e33a0')



_svntrunk=https://aesthe.svn.sourceforge.net/svnroot/aesthe 
_svnmod=aesthe

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
  cd "$srcdir/$_svnmod-build/aesthe"
  cp ../../../Makefile ./
  cp ../../../Makefile2 ./src/Makefile
  export PKGDIR=$pkgdir
  #
  # BUILD
  #
  #./autogen.sh
  #./configure --prefix=/usr
  make all || return 1
  make install
}
