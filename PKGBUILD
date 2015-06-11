# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=sophia-git
pkgver=r272.60851aa
pkgrel=1
pkgdesc="Modern embeddable transactional key-value storage"
arch=('any')
url="https://github.com/pmwkaa/sophia"
license=('BSD2')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')
options=('staticlibs')
conflicts=('sophia')

pkgver() {
  cd "$(basename $url)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$(basename $url)"
  make
}

check() {
  return 0 # Remove this line to perform the tests (~2min)

  cd "$srcdir/$(basename $url)/test"
  make
  ./run
}

package() {
  cd "$srcdir/$(basename $url)"

  install -Dm644 sophia.h "$pkgdir/usr/include/sophia/sophia.h"
  install -Dm644 libsophia.a "$pkgdir/usr/lib/libsophia.a"

  for so in libsophia.so*
  do
    install -Dm644 "$so" "$pkgdir/usr/lib/$so"
  done

  # LICENSE
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
