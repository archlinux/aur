# Maintainer: Edmund Lodewijks <edmund AT proteamail DOT com>
# Contributor: Anthony VanBerkum <anthonyvbop AT gmail DOT com>
# Contributor: Laércio de Sousa <lbsousajr AT gmail DOT com>
# Contributor: David Gippner davidgippner at googlemail dot com
pkgbase=gregorio
pkgname="$pkgbase"
pkgver=6.1.0
pkgrel=2
_pkgver_underscores=$(echo $pkgver | sed -e 's/\./_/g')
pkgdesc="Command-line tool to typeset Gregorian chant"
url=https://gregorio-project.github.io
arch=("i686" "x86_64")
license=("GPL-3.0-only" "OFL-1.0" "GPL-3.0-with-font-exception")
depends=("texlive-fontsextra" "texlive-bin" "texlive-formatsextra" "texlive-latexextra")
optdepends=("texlive-langeuropean: Latin language for TeX Live")
conflicts=("gregorio-svn" "gregorio-git" "gregoriotex")
provides=("gregorio")
source=("https://github.com/gregorio-project/gregorio/releases/download/v$pkgver/gregorio-$pkgver.tar.bz2"
        "https://github.com/gregorio-project/gregorio/releases/download/v$pkgver/supp_fonts-$_pkgver_underscores.zip")
sha256sums=('7781843c3f454067e18236e27cfb593143fa0eff6f6df15482b163cb4a4f2ca4'
            '5c45b53435b15f9bd527e29760711a6cb1769ae5206848e9c731aa2af9589c95')


prepare() {
  cd "$srcdir/$pkgbase-$pkgver/"
  autoreconf -f -i
  ./configure --prefix=/usr/bin || return 1
}

build() {
  cd "$srcdir/$pkgbase-$pkgver/"
  make -j || return 1
}

package() {
  cd "$srcdir/$pkgbase-$pkgver/"
  make -j DESTDIR="$pkgdir/" install || return 1
  
  # Install TeX files
  ./install-gtex.sh dir:$pkgdir/usr/share/texmf || return 1
  
  # Install fonts
  cd "$srcdir/"
  texlua install_supp_fonts.lua $pkgdir/usr/share/texmf || return 1
}
