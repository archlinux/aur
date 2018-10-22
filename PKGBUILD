# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=trellis-git
pkgver=r311.aa2b109
pkgrel=1
pkgdesc='Tools and scripts which allow you to document the bit-stream format of Lattice ECP5 series FPGAs'
arch=('i686' 'x86_64')
url='https://github.com/SymbiFlow/prjtrellis'
license=('custom:ISC')
depends=('boost-libs' 'python')
makedepends=('git' 'cmake' 'rsync' 'boost')
provides=('trellis')
conflicts=('trellis')
source=('trellis::git+https://github.com/SymbiFlow/prjtrellis.git'
        'database::git+https://github.com/SymbiFlow/prjtrellis-db.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/trellis"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/trellis"
  rsync -a --exclude='.*' "$srcdir/database/" database/
}

build() {
  cd "$srcdir/trellis/libtrellis"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

check() {
  cd "$srcdir/trellis/libtrellis/tests"
  ./run_all.sh
}

package() {
  cd "$srcdir/trellis/libtrellis"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/trellis/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # nextpnr requires these files by they aren't installed by `make install`
  install -Dm644 pytrellis.so "$pkgdir/usr/share/trellis/libtrellis/pytrellis.so"
  cp -R "$srcdir/trellis/util" "$pkgdir/usr/share/trellis"
}
