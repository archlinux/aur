# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mit-scheme-git
pkgver=10.1.2.17182_ded2d658a
pkgrel=1
pkgdesc="MIT/GNU Scheme from git"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/mit-scheme/"
license=('GPL')
depends=('mhash' 'libmcrypt' 'ncurses' 'libx11' 'postgresql-libs' 'termcap')
optdepends=('openssl: support for openssl')
makedepends=('git' 'mit-scheme')
provides=('mit-scheme')
conflicts=('mit-scheme')
source=("git+http://git.savannah.gnu.org/r/mit-scheme.git")
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}/src
  ver=$(grep AC_INIT configure.ac | cut -d \[ -f 3 | cut -d \] -f 1)."$(git rev-list --count HEAD)"
  hsh=$(git rev-parse --short HEAD)
  echo ${ver}_${hsh}
}

build() {
  cd ${pkgname%-git}/src
  ./Setup.sh
  ./configure --prefix=`pwd`/boot --with-x --enable-native-code --disable-default-plugins
  make
  make install
  make distclean
  export MIT_SCHEME_EXE=`pwd`/boot/bin/mit-scheme
  export MITSCHEME_LIBRARY_PATH=`pwd`/boot/lib/mit-scheme-x86-64/
  ./configure --prefix=/usr --with-x --enable-native-code
  make
  cd "$srcdir"/${pkgname%-git}/doc
  autoconf
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname%-git}/src
  env FAST=y make check
}

package() {
  cd ${pkgname%-git}/src
  make DESTDIR="$pkgdir/" install
  cd ${srcdir}/${pkgname%-git}/doc
  make DESTDIR="$pkgdir/" install
}
