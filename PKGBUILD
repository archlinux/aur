# Maintainer: Br Anthony VanBerkum <anthonyvbop AT gmail DOT com>
# Contributor: Laércio de Sousa <lbsousajr AT gmail DOT com>
# Contributor: David Gippner davidgippner at googlemail dot com
pkgbase=gregorio
pkgname=$pkgbase
pkgver=4.1.4
pkgrel=1
pkgdesc="Command-line tool to typeset Gregorian chant"
url=http://gregorio-project.github.io
arch=("i686" "x86_64")
license=("GPL")
depends=("texlive-core" "texlive-fontsextra" "texlive-bin" "texlive-formatsextra" "texlive-latexextra")
conflicts=("gregorio-svn" "gregorio-git" "gregoriotex")
provides=("gregorio")
install=gregorio.install
source=("https://github.com/gregorio-project/gregorio/releases/download/v$pkgver/gregorio-$pkgver.tar.bz2")
sha256sums=("971093bfe18becbeb8b019abd554503a75cb550f9a1501af40621904424aa35c")


prepare() {
  # Standardise src dir name without using a private variable.
  mv "$srcdir/$pkgbase-$pkgver/" "$srcdir/$pkgbase/"
  msg "Configuring..."
  cd "$srcdir/$pkgbase/"
  autoreconf -f -i
  ./configure --prefix=/usr || return 1
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
  msg "Installing fonts and TeX files..."
  cd "$srcdir/$pkgbase/"
  ./install-gtex.sh dir:$pkgdir/usr/share/texmf-dist || return 1
}
