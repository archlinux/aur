# 6.1.0 pkgrel 3 Changelog:
#   - Cleaned up PKGBUILD
#   - Don't install font sources
#   - Simplify version number generation
#   - Install License files
#   - Softlink docs to /usr/share/doc (where one might look for docs)
#   - Disable version number in exe


# Maintainer: Edmund Lodewijks <edmund@proteamail.com>
# Contributor: Br Anthony VanBerkum <anthonyvbop AT gmail DOT com>
# Contributor: Br. Elijah Schwab (github - eschwab)

pkgname=gregorio-git
_pkgname=gregorio
pkgver=r4777.f2cd811
pkgrel=1
pkgdesc="Command-line tool to typeset Gregorian chant"
url=http://gregorio-project.github.io
arch=("i686" "x86_64")
license=("GPL-3.0-only" "OFL-1.1" "GPL-3.0-with-font-exception")
makedepends=(
	"git"
	"python"
	"fontforge"
)
depends=(
	"texlive-core"
	"texlive-fontsextra"
	"texlive-bin"
	"texlive-formatsextra"
	"texlive-latexextra"
)
conflicts=(
	"gregorio-svn"
	"gregorio"
	"gregoriotex"
)
provides=("gregorio")
source=(
	"$_pkgname::git+https://github.com/gregorio-project/gregorio.git#branch=develop"
)
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname/"

  autoreconf -fi
  ./configure \
      --prefix=/usr 
}

build() {
  cd "$srcdir/$_pkgname/"
  make

  cd "$srcdir/$_pkgname/fonts/"
  make really-all-fonts
}

package() {
  cd "$srcdir/$_pkgname/"
  make DESTDIR="$pkgdir/" install
  
  # Install TeX files (includes docs)
  SKIP=docs,font-sources ./install-gtex.sh dir:$pkgdir/usr/share/texmf
  
  # Install fonts
  cd "$srcdir/$_pkgname/fonts"
  texlua install_supp_fonts.lua $pkgdir/usr/share/texmf

  # Install license
  install -Dm0755 $srcdir/$_pkgname/{COPYING.md,CONTRIBUTORS.md} -t $pkgdir/usr/share/licenses/$_pkgname
}
