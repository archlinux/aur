# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Nagy Gabor <ngaba@@bibl..u-szeged..hu>

_name=enigma_sdl
pkgbase=$_name-svn
pkgname=($_name-svn $_name-docs-svn)
pkgver=1.20.r2430
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Puzzle game inspired by Oxyd on the Atari ST and Rock'n'Roll on the Amiga (development version)"
url="http://www.nongnu.org/enigma/"
makedepends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'xerces-c' 'imagemagick' 'texi2html' 'subversion')
source=($_name::"svn+http://svn.code.sf.net/p/enigma-game/source/trunk")
md5sums=('SKIP')

pkgver() {
  cd $_name
  # get version from autotools
  local ver="$(grep 'AC_INIT(.*)' configure.ac | sed 's/[^0-9\.]*//g')"
  local rev="$(svnversion)"
  printf "%s.r%s" "$ver" "${rev//[[:alpha:]]}"
}

build() {
  cd $_name

  ./autogen.sh
  ./configure --prefix=/usr --program-suffix=_sdl --enable-optimize
  make
}

package_enigma_sdl-svn() {
  depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'xerces-c' 'hicolor-icon-theme')
  install=$_name.install
  conflicts=("$_name")
  provides=("$_name")

  make -C $_name DESTDIR="$pkgdir/" install
  # remove enet files to avoid file conflicts
  rm -rf "$pkgdir"/usr/{include,lib}
  # correct name in launcher
  sed 's/Exec=enigma$/&_sdl/g' -i "$pkgdir"/usr/share/applications/enigma.desktop
  # remove things present in docs package
  rm -rf "$pkgdir"/usr/share/doc/enigma/{images,manual,reference,index.html}
}

package_enigma_sdl-docs-svn() {
  arch=('any')
  pkgdesc="Enigma puzzle game html documentation"
  optdepends=('lua: for reference generator')

  make -C $_name/doc DESTDIR="$pkgdir/" install-data
  # remove things present in main package
  rm -rf "$pkgdir"/usr/share/{man,doc/enigma/*.txt}
}
