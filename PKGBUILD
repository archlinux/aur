# Maintainer: WithoutAName <withoutaname@withoutaname.eu>
pkgname=dot-manager
pkgver=0.3.1
pkgrel=1
pkgdesc="CLI Utility for easy dotfile management"
arch=("x86_64")
_repo=DotManager
url="https://github.com/WithoutAName25/$_repo"
license=("MIT")
depends=("gcc-libs" "glibc")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dc5b8af5b2776b0e8e695725cb7c4804ee125b3ac58a2a2a3bd4bccd778fe5ed')

prepare() {
  cd "$srcdir/$_repo-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_repo-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features
}

package() {
  cd "$srcdir/$_repo-$pkgver"

  install -Dm755 target/release/dot-manager "$pkgdir/usr/bin/dot-manager"

  install -Dm644 target/generated/completions/dot-manager.bash "$pkgdir/usr/share/bash-completion/completions/dot-manager"
  install -Dm644 target/generated/completions/dot-manager.fish "$pkgdir/usr/share/fish/vendor_completions.d/dot-manager.fish"
  install -Dm644 target/generated/completions/_dot-manager "$pkgdir/usr/share/zsh/site-functions/_dot-manager"

  for file in target/generated/manpage/dot-manager*.1; do
    install -Dm644 "$file" "$pkgdir/usr/share/man/man1/$(basename "$file")"
    gzip "$pkgdir/usr/share/man/man1/$(basename "$file")"
  done

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

