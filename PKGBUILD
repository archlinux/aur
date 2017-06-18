# Maintainer: JP Cimalando <jp-dev@inbox.ru>
pkgname=pd-flext-git
_pkgname=flext
pkgver=r1353.098455b
pkgrel=3
pkgdesc="C++ development layer for Pure Data"
arch=('i686' 'x86_64')
url="https://grrrr.org/research/software/flext/"
license=('GPL')
groups=()
depends=('gcc-libs')
makedepends=('git' 'pd')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=('staticlibs')
install=
source=("$_pkgname::git+https://github.com/grrrr/flext.git"
        'flext-cpp11.patch')
md5sums=('SKIP'
         '21e110a285bb2bfed260557b39de46a5')
noextract=()

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 -i "$srcdir/$_pkgname-cpp11.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  ./bootstrap.sh
  ./configure --prefix=/usr --with-sdkdir=/usr/include/pd
  make
}

check() {
  cd "$srcdir/$_pkgname"
  make -k check
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
