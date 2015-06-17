# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=tarantool-git
pkgver=1.6.4.r451.gafa312b
pkgrel=1
pkgdesc='an in-memory database designed to store the most volatile and highly accessible web content'
arch=(i686 x86_64)
url='http://www.tarantool.org'
license=(BSD)
#backup=(etc/tarantool/tarantool.cfg)
install=tarantool.install
depends=(readline ncurses)
makedepends=(git cmake)
checkdepends=(python2-daemon python2-yaml)
source=(git://github.com/tarantool/tarantool.git
        git://github.com/tarantool/luajit.git
        git://github.com/tarantool/tarantool-python.git
        git://github.com/msgpack/msgpack-python.git
        git://github.com/tarantool/msgpuck.git
        git://github.com/rtsisyk/luafun.git
        git://github.com/tarantool/sophia.git#branch=dev
        tarantool.systemd)
sha1sums=('SKIP'
          'SKIP'
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

prepare() {
  cd tarantool
  find . -type f -exec sed \
      -e 's_^#!/usr/bin/env python$_&2_' \
      -i {} \;
}

build() {
  cd tarantool

  # tarantool uses git submodule, handle this
  git submodule init
  git config -f .gitmodules 'submodule.third_party/luajit.url' "$srcdir/luajit"
  git config -f .gitmodules 'submodule.test/lib/tarantool-python.url' "$srcdir/tarantool-python"
  git config -f .gitmodules 'submodule.test/lib/msgpack-python.url' "$srcdir/msgpack-python"
  git config -f .gitmodules 'submodule.src/lib/msgpuck.url' "$srcdir/msgpuck"
  git config -f .gitmodules 'submodule.sophia.url' "$srcdir/sophia"
  git config -f .gitmodules 'submodule.third_party/luafun.url' "$srcdir/luafun"
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
