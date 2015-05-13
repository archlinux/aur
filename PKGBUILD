# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Rich Lane <rlane@club.cc.cmu.edu>

_pkgname=oort
pkgname=oort-git
pkgver=r394.7aacb6d
pkgrel=2
pkgdesc="space fleet programming game"
arch=('i686' 'x86_64')
url="https://github.com/rlane/Oort"
license=("GPL")
depends=('boost-libs' 'box2d' 'glib2' 'glew' 'lua')
makedepends=('automake-1.11' 'boost' 'sdl')
optdepends=('sdl: for oort_sdl')
source=($_pkgname::git://github.com/rlane/Oort
        0002-headless-Included-iostream-else-it-failed-of-cerr.patch
        0003-Sim-AI-lua_resume-update.patch
        0004-Sim-Ship-Update-on-box2d-functions.patch)
md5sums=('SKIP'
         '7eb888feddcf89eba7f22c1cf88928b6'
         'e6e2a9aaecb1186dd4907a18880f860e'
         '656f4d154950976b937f7c7e7209b0d9')


pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  git submodule init
  git submodule update

  patch -p1 -i $srcdir/0002-headless-Included-iostream-else-it-failed-of-cerr.patch
  patch -p1 -i $srcdir/0003-Sim-AI-lua_resume-update.patch
  patch -p1 -i $srcdir/0004-Sim-Ship-Update-on-box2d-functions.patch
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
}
