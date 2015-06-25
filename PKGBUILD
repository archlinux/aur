# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

pkgname=libmaxminddb-git
_gitname=libmaxminddb
pkgver=r869.cbae1a2
pkgrel=1
pkgdesc="C library for the MaxMind DB file format"
arch=('i686' 'x86_64')
url="https://github.com/maxmind/libmaxminddb"
license=('GPL')
depends=('glibc')
makedepends=('git')
conflicts=()
options=('!libtool')
provides=()
source=("$_gitname::git+https://github.com/maxmind/libmaxminddb.git"
        'libtap::git+https://github.com/zorgnax/libtap.git'
        'MaxMind-DB::git+https://github.com/maxmind/MaxMind-DB.git')

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  git config submodule.maxmind-db.url "$srcdir/MaxMind-DB"
  git config submodule.t/libtap.url "$srcdir/libtap"
  git config submodule.t/maxmind-db.url "$srcdir/MaxMind-DB"
  git submodule update
}

build() {
  cd "$srcdir/$_gitname"
  rm -f ltmain.sh
  autoreconf -fiv
  ./configure --prefix=/usr
}

check() {
  cd "$srcdir/$_gitname"
  make check
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
