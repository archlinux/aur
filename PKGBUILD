# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=tarantool-git
pkgver=1.6.6.r269.gfe1519e
pkgrel=1
pkgdesc='an in-memory database designed to store the most volatile and highly accessible web content'
arch=(i686 x86_64)
url='http://www.tarantool.org'
license=(BSD)
#backup=(etc/tarantool/tarantool.cfg)
install=tarantool.install
depends=(readline ncurses zlib)
makedepends=(git cmake)
checkdepends=(python2-daemon python2-yaml python2-msgpack python2-tarantool python2-gevent)
source=(git://github.com/tarantool/tarantool.git
        git://github.com/tarantool/luajit.git
        git://github.com/tarantool/msgpuck.git
        git://github.com/rtsisyk/luafun.git
        git://github.com/tarantool/sophia.git#branch=current
        git://github.com/tarantool/test-run.git
        tarantool.systemd)
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'ad36cc26a66a50e8537570bfed5b620c775a9f85')

pkgver() {
  cd tarantool
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
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
  git submodule sync
  git submodule update

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc/tarantool \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/var \
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

  install -D -m644 "$srcdir/tarantool.systemd" "$pkgdir/usr/lib/systemd/system/tarantool.service"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$pkgdir/usr/share/doc/tarantool/LICENSE"
}
