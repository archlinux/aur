# Maintainer: Br Anthony VanBerkum <anthonyvbop AT gmail DOT com>
# Contributor: Br. Elijah Schwab (github - eschwab)
pkgbase=gregorio-git
pkgname=$pkgbase
pkgver=3.0.2.r2092.4839061
pkgrel=1
pkgdesc="Command-line tool to typeset Gregorian chant"
url=http://gregorio-project.github.io
arch=("i686" "x86_64")
license=("GPL")
makedepends=("git" "python" "fontforge")
depends=("texlive-core" "texlive-fontsextra" "texlive-bin" "texlive-formatsextra" "texlive-latexextra")
conflicts=("gregorio-svn" "gregorio" "gregoriotex")
provides=("gregorio")
install=gregorio.install
source=("$pkgbase::git+https://github.com/gregorio-project/gregorio.git#branch=develop")
sha256sums=("SKIP")


pkgver() {
  cd "$srcdir/$pkgbase/"
  _version=$(python2 VersionManager.py -c | sed -e "s/-/_/g")
  echo $_version.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  msg "Configuring..."
  cd "$srcdir/$pkgbase/"
  autoreconf -f -i
  ./configure --prefix=/usr || return 1
}

build() {
  msg "Compiling gregorio..."
  cd "$srcdir/$pkgbase/"
  make -j || return 1
  msg "Building fonts..."
  cd "$srcdir/$pkgbase/fonts/"
  make -j fonts || return 1
}

package() {
  cd "$srcdir/$pkgbase/"
  msg "Installing gregorio..."
  make -j DESTDIR="$pkgdir/" install || return 1
  msg "Installing fonts and TeX files..."
  cd "$srcdir/$pkgbase/"
  ./install-gtex.sh dir:$pkgdir/usr/share/texmf-dist || return 1
}
