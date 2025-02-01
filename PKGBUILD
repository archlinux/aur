# Maintainer: UnkwUsr <ktoto2707043@gmail.com>

_pkgname='nctok'
pkgname='nctok-git'
pkgver=r48.1087c21
pkgrel=1
pkgdesc="TUI utility for interactive exploring weighted hierarchical structured data"
arch=('i686' 'x86_64')
url="https://github.com/UnkwUsr/nctok"
license=('MIT')
provides=("nctok")
makedepends=('cargo')
conflicts=('nctok')
source=("$pkgname::git+$url")
sha1sums=('SKIP')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/README.md" "README.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/examples.md" "doc/examples.md"
}
