# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=trellis
pkgver=1.0
_databasever=d0b219af41ae3da6150645fbc5cc5613b530603f
pkgrel=1
pkgdesc='Tools and scripts which allow you to document the bit-stream format of Lattice ECP5 series FPGAs'
arch=('i686' 'x86_64')
url='https://github.com/SymbiFlow/prjtrellis'
license=('custom:ISC')
depends=('boost-libs' 'python')
makedepends=('cmake' 'rsync' 'boost')
source=("https://github.com/SymbiFlow/prjtrellis/archive/$pkgver.tar.gz"
        "https://github.com/SymbiFlow/prjtrellis-db/archive/$_databasever.tar.gz")
sha256sums=('6cfa12b7bf1ad5aed2b711fdfdd5ade6a2047f4733a704cb0b04634d350a4e26'
            '1f1b71741e8b70af777561a1422be8a01992ea46b363da24b7b97e41fa0fa5c5')

prepare() {
  cd "$srcdir/prjtrellis-$pkgver"
  rsync -a --exclude='.*' "$srcdir/prjtrellis-db-$_databasever/" database/
}

build() {
  cd "$srcdir/prjtrellis-$pkgver/libtrellis"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

check() {
  cd "$srcdir/prjtrellis-$pkgver/libtrellis/tests"
  ./run_all.sh
}

package() {
  cd "$srcdir/prjtrellis-$pkgver/libtrellis"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
  install -Dm644 "$srcdir/prjtrellis-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # used by the examples to convert the bitstreams to SVF files for programming
  install -D "$srcdir/prjtrellis-$pkgver/tools/bit_to_svf.py" "$pkgdir/usr/share/trellis/tools/bit_to_svf.py"
}
