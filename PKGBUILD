pkgname=wak-git
pkgver=24.10.24.ge8302cd
pkgrel=1
pkgdesc="wak -- an awk implementation for toybox and standalone"
arch=('x86_64')
url="https://github.com/raygard/wak.git"
license=('0BSD')
depends=()
makedepends=('git' 'clang' 'make')
source=("git+https://github.com/raygard/wak.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/wak"
  git describe --always --long --tags 2>/dev/null \
    | sed 's/^v//; s/-/./g'
}

build() {
  cd "$srcdir/wak"

  export CC=clang
  export CFLAGS="-O3 -march=native -mtune=native \
                 -funroll-loops \
                 -falign-functions=32 -falign-loops=32 \
                 -fno-math-errno -fno-trapping-math \
                 -fno-semantic-interposition \
                 -fomit-frame-pointer -fno-plt \
                 -Wall -pipe -flto"

  export LDFLAGS="-fno-plt -flto"

  ./configure CC=clang CFLAGS="$CFLAGS"
  make -j$(nproc)
}

package() {
  cd "$srcdir/wak"

  # Install binary
  install -Dm755 wak "$pkgdir/usr/bin/wak"

  # Install manpage
  install -Dm644 wak.man "$pkgdir/usr/share/man/man1/wak.1"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
