# Maintainer: Max 1pro100me1@gmail.com
pkgname=relation-git
pkgver=0.3.2.r211.g5986ca7
pkgrel=1
pkgdesc="Tiny proxy client based on sing-box"
arch=('x86_64' 'aarch64')
url="https://github.com/snbm1/relation"
license=('custom')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'clang' 'git' 'go')
provides=('relation')
conflicts=('relation')
source=('git+https://github.com/snbm1/relation.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/relation"

  local version rev hash
  version="$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)"
  rev="$(git rev-list --count HEAD)"
  hash="$(git rev-parse --short=7 HEAD)"

  printf '%s.r%s.g%s\n' "$version" "$rev" "$hash"
}

build() {
  cd "$srcdir/relation"

  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/go-mod"
  export CARGO_HOME="$srcdir/cargo-home"

  cargo clean
  make release
}

package() {
  cd "$srcdir/relation"

  install -Dm755 target/release/relation "$pkgdir/usr/bin/relation"
  install -Dm755 target/release/relationd "$pkgdir/usr/bin/relationd"
  install -Dm755 librelation.so "$pkgdir/usr/lib/librelation.so"
  install -Dm644 README.md "$pkgdir/usr/share/doc/relation/README.md"
}
