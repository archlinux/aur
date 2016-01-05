# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=tarantool
_commit=3dbc9ffe87307cd8f2ae84ce67824695c7eaf369
pkgver=1.6.7.r562
pkgrel=1
pkgdesc='Lua application server integrated with a database management system'
arch=(i686 x86_64)
url='http://www.tarantool.org'
license=(BSD)
depends=(readline ncurses zlib)
makedepends=(git cmake)
checkdepends=(python2-daemon python2-gevent python2-tarantool)
source=(git://github.com/tarantool/tarantool.git#commit=$_commit
        git://github.com/tarantool/luajit.git
        git://github.com/tarantool/msgpuck.git
        git://github.com/rtsisyk/luafun.git
        git://github.com/tarantool/sophia.git
        git://github.com/tarantool/test-run.git
        git://github.com/tarantool/small.git)
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

pkgver() {
  cd tarantool
  git describe | sed 's/^v//; s/-/.r/; s/-.*//'
}

build() {
  cd tarantool

  # tarantool uses git submodule, handle this
  git submodule init
  git config -f .gitmodules 'submodule.third_party/luajit.url' "$srcdir/luajit"
  git config -f .gitmodules 'submodule.src/lib/msgpuck.url' "$srcdir/msgpuck"
  git config -f .gitmodules 'submodule.third_party/luafun.url' "$srcdir/luafun"
  git config -f .gitmodules 'submodule.sophia.url' "$srcdir/sophia"
  git config -f .gitmodules 'submodule.test-run.url' "$srcdir/test-run"
  git config -f .gitmodules 'submodule.src/lib/small.url' "$srcdir/small"
  git submodule sync
  git submodule update

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc/tarantool \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    .

  make
}

check() {
  cd tarantool/test
  ./test-run.py --suite box
}

package() {
  cd tarantool
  make install DESTDIR="$pkgdir"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$pkgdir/usr/share/doc/tarantool/LICENSE"
}
