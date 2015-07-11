# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=texinfo-svn
pkgver=6411
pkgrel=1
pkgdesc="GNU documentation system for on-line information and printed output"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/texinfo/"
license=('GPL')
groups=('base' 'base-devel')
depends=('ncurses' 'findutils' 'gzip' 'perl' 'sh')
makedepends=('subversion')
provides=('texinfo')
conflicts=('texinfo')
install=texinfo.install
source=("texinfo::svn://svn.sv.gnu.org/texinfo/trunk" activate_plaintext_pm.patch)
md5sums=('SKIP'
         '91730d301ea8c0a687f392e2f1a49c0b')
options=('!makeflags')
_svnmod=texinfo

pkgver() {
  cd "$srcdir"/"${_svnmod}"
  local ver="$(svnversion)"
  printf "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir"/"${_svnmod}"
  patch -Np0 < $srcdir/activate_plaintext_pm.patch || true
}

build() {
  cd "$srcdir"/"${_svnmod}"
  export LANG=C
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/"${_svnmod}"
  make DESTDIR="$pkgdir/" install
}
