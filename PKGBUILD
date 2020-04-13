pkgname=sdb-git
pkgver=1.4.1+r14.20200409.geb148d8
pkgrel=1
pkgdesc="Simple and fast string key/value database based on djb's cdb, supports JSON and arrays introspection"
url=https://github.com/radareorg/sdb
license=(MIT)
source=(git+$url)
b2sums=(SKIP)
arch=(x86_64 i686 aarch64)
optdepends=('glib2: vala bindings')
makedepends=(vala git)
conflicts=(sdb)

pkgver() {
  cd sdb
  local _long=$(git describe --long --tags | sed 's|^\([^-]\+\)-\([0-9]\+\)-\(g[0-9a-f]\+\)|\1+r\2.\3|')
  local _date=$(git log -n1 --format=%cs)
  echo ${_long%.*}.${_date//-/}.${_long##*.}
}

prepare() {
  cd sdb
  make clean
  git clean -xdf
}

build() {
  cd sdb
  make
}

check() {
  cd sdb
  VERBOSE=1 make test
}

package() {
  cd sdb
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -dm755 "$pkgdir"/usr/share/{doc,licenses}/sdb
  install -pm644 AUTHORS README.md TODO "$pkgdir"/usr/share/doc/sdb
  install -dm755 "$pkgdir"/usr/share/doc/sdb/book
  install -pm644 doc/* "$pkgdir"/usr/share/doc/sdb/book
  install -pm644 COPYING "$pkgdir"/usr/share/licenses/sdb
}
