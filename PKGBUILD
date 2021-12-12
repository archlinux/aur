pkgname=libg7221_decode-git
pkgver=r3.0d6324a
pkgrel=2
pkgdesc='ITU-T G.722.1 annex C (G.722.1C) audio decoding library'
arch=(x86_64)
url='https://github.com/kode54/libg7221_decode'
license=(LGPL3)
depends=()
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname}::git+https://github.com/kode54/libg7221_decode.git
        libsiren::git+https://github.com/kode54/libsiren.git)
sha256sums=(SKIP SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.libsiren.url "$srcdir"/libsiren
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  ( set -ex; gcc $CFLAGS $CPPFLAGS $LDFLAGS *.c libsiren/*.c -shared -fPIC -o libg7221.so -lm )
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 g7221.h "$pkgdir/usr/include/g7221.h"
  install -Dm755 libg7221.so "$pkgdir/usr/lib/libg7221.so"
}
