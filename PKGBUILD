# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=pg_ulid
pkgver=r4.63c3a88
pkgrel=2
pkgdesc='Experimental PostgreSQL extension for generating ULIDs'
arch=('x86_64')
url="https://github.com/iCyberon/pg_ulid"
license=('MIT')
depends=(postgresql glibc)
makedepends=(go git)
source=("$pkgname::git+https://github.com/iCyberon/pg_ulid.git"
        "$pkgname.patch")
sha512sums=('SKIP'
            '0c2c109705de12b9d802f141b2a41cb33c631210f6724f284e1c8601769406534bd4934503e6992a0b860f6ab118a49b2a2ee48300770f9f39b0bf3a16698493')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  # patch makefile
  patch --input="$srcdir/$pkgname.patch"

  # download go dependencies
  go mod init github.com/iCyberon/pg_ulid/m
  go mod tidy
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install with_llvm=no

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname/LICENSE"
}
