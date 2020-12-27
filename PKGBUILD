# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=trellis-git
pkgver=r977.9b3db7b
pkgrel=1
pkgdesc='Tools and scripts which allow you to document the bit-stream format of Lattice ECP5 series FPGAs'
arch=('i686' 'x86_64')
url='https://github.com/YosysHQ/prjtrellis'
license=('custom:ISC')
depends=('boost-libs' 'python')
makedepends=('git' 'cmake' 'boost')
provides=('trellis')
conflicts=('trellis')
source=('trellis::git+https://github.com/YosysHQ/prjtrellis.git'
        'database::git+https://github.com/YosysHQ/prjtrellis-db.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/trellis"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/trellis"
  git submodule init
  git config submodule.database.url "$srcdir/database"
  git submodule update
}

build() {
  cd "$srcdir/trellis/libtrellis"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/trellis/libtrellis"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/trellis/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # used by the examples to convert the bitstreams to SVF files for programming
  install -D "$srcdir/trellis/tools/bit_to_svf.py" "$pkgdir/usr/share/trellis/tools/bit_to_svf.py"
}
