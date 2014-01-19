# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Nagy Gabor <ngaba@@bibl..u-szeged..hu>

_pkgbase=enigma_sdl
pkgname=$_pkgbase-svn
pkgver=1.20.r2383
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Puzzle game inspired by Oxyd on the Atari ST and Rock'n'Roll on the Amiga (development version)"
url="http://www.nongnu.org/enigma/"
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'xerces-c' 'hicolor-icon-theme')
makedepends=('imagemagick' 'texi2html' 'subversion')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
install=$_pkgbase.install
source=($_pkgbase::"svn+http://svn.code.sf.net/p/enigma-game/source/trunk")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  # get version from autotools
  local ver="$(grep 'AC_INIT(.*)' configure.ac | sed 's/[^0-9\.]*//g')"
  local rev="$(svnversion)"
  printf "%s.r%s" "$ver" "${rev//[[:alpha:]]}"
}

build() {
  cd $_pkgbase

  ./autogen.sh
  ./configure --prefix=/usr --program-suffix=_sdl --enable-optimize
  make
}

package() {
  cd $_pkgbase

  make DESTDIR="$pkgdir/" install

  # removing enet files to avoid file conflicts
  rm -rf "$pkgdir"/usr/{include,lib}
  # correct name
  sed 's/Exec=enigma$/&_sdl/g' -i "$pkgdir"/usr/share/applications/enigma.desktop
}
