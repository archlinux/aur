# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mit-scheme-git
pkgver=13.0.50.r18718.6afb904d359
pkgrel=1
pkgdesc="MIT/GNU Scheme from git"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/mit-scheme/"
license=('GPL')
depends=('mhash' 'libmcrypt' 'ncurses' 'libx11' 'postgresql-libs' 'termcap')
optdepends=('openssl: support for openssl')
makedepends=('git' 'mit-scheme' 'texlive-latex')
provides=('mit-scheme')
conflicts=('mit-scheme')
source=("git+http://git.savannah.gnu.org/r/mit-scheme.git")
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}/src
  ver=$(grep AC_INIT configure.ac | cut -d \[ -f 3 | cut -d \] -f 1).r"$(git rev-list --count HEAD)"
  hsh=$(git rev-parse --short HEAD)
  echo ${ver}.${hsh}
}

build() {
  cd ${pkgname%-git}/src
  export LANG=C
  ./Setup.sh
  export CFLAGS=" -fcommon -Wno-error=use-after-free"
  ./configure --prefix=`pwd`/boot --with-x --enable-x11 
  make
  make install
  make distclean

  ./configure --prefix=/usr --with-x --enable-x11 --enable-native-code
  make
  cd "$srcdir"/${pkgname%-git}/doc
  autoconf
  ./configure --prefix=/usr --enable-pdf --disable-html
  make
}

check() {
  cd ${pkgname%-git}/src
  env FAST=y make check
}

package() {
  cd ${pkgname%-git}/src
  make DESTDIR="$pkgdir/" install
  cd "$srcdir"/${pkgname%-git}/doc
  make DESTDIR="$pkgdir/" install
}
