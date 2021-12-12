pkgname=libatrac9-git
pkgver=r19.6a9e00f
pkgrel=1
pkgdesc="A library for decoding audio in Sony's ATRAC9 format"
arch=(x86_64)
url='https://github.com/Thealexbarney/LibAtrac9'
license=(MIT)
depends=()
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname}::git+https://github.com/Thealexbarney/LibAtrac9.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"/C
  sed -i 's/^\(LFLAGS =.*\)/\1 -lm '"$LDFLAGS"/ Makefile
}

build() {
  cd "$srcdir/$pkgname"/C
  make shared CC="gcc $CFLAGS $CPPFLAGS"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd C
  install -Dm644 src/libatrac9.h "$pkgdir/usr/include/libatrac9.h"
  install -Dm755 bin/libatrac9.so "$pkgdir/usr/lib/libatrac9.so"
}
