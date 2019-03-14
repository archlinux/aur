# Maintainer: Br Anthony VanBerkum <anthonyvbop AT gmail DOT com>
# Contributor: Laércio de Sousa <lbsousajr AT gmail DOT com>
# Contributor: David Gippner davidgippner at googlemail dot com
pkgbase=gregorio
pkgname=$pkgbase
pkgver=5.2.0
pkgrel=1
_pkgver_underscores=$(echo $pkgver | sed -e 's/\./_/g')
pkgdesc="Command-line tool to typeset Gregorian chant"
url=http://gregorio-project.github.io
arch=("i686" "x86_64")
license=("GPL")
depends=("texlive-core" "texlive-fontsextra" "texlive-bin" "texlive-formatsextra" "texlive-latexextra")
conflicts=("gregorio-svn" "gregorio-git" "gregoriotex")
provides=("gregorio")
source=("https://github.com/gregorio-project/gregorio/releases/download/v$pkgver/gregorio-$pkgver.tar.bz2"
        "https://github.com/gregorio-project/gregorio/releases/download/v$pkgver/supp_fonts-$_pkgver_underscores.zip")
sha256sums=("f9cdcf69527a04304e7ac95ed722498ec9ca57b407f8638d258dcb6c6e2019e2"
            "b1dd803d6026448202335f9da4d539412b5c3ce4622b4d7e89dddd6c6accd222")


prepare() {
  # Standardise src dir name without using a private variable.
  mv "$srcdir/$pkgbase-$pkgver/" "$srcdir/$pkgbase/"
  msg "Configuring..."
  cd "$srcdir/$pkgbase/"
  autoreconf -f -i
  ./configure --prefix=/usr/local || return 1
}

build() {
  msg "Compiling gregorio..."
  cd "$srcdir/$pkgbase/"
  make -j || return 1
}

package() {
  cd "$srcdir/$pkgbase/"
  msg "Installing gregorio..."
  make -j DESTDIR="$pkgdir/" install || return 1
  msg "Installing TeX files..."
  cd "$srcdir/$pkgbase/"
  ./install-gtex.sh dir:$pkgdir/usr/share/texmf || return 1
  msg "Installing fonts..."
  cd "$srcdir/"
  texlua install_supp_fonts.lua $pkgdir/usr/share/texmf || return 1
}
