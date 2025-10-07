# Maintainer: WithoutAName <withoutaname@withoutaname.eu>
pkgname=dot-manager
_repo=DotManager
_cmd=dot-manager
pkgver=0.3.3
pkgrel=1
pkgdesc="CLI Utility for easy dotfile management"
arch=("x86_64")
url="https://github.com/WithoutAName25/$_repo"
license=("MIT")
depends=("gcc-libs" "glibc")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3ec998cdadf8e56e40109b088a4ba073fb13a41fcf0d0724d1a59e2bf376991')

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

  install -Dm755 "target/release/$_cmd" "$pkgdir/usr/bin/$_cmd"

  install -Dm644 "target/generated/completions/$_cmd.bash" "$pkgdir/usr/share/bash-completion/completions/$_cmd"
  install -Dm644 "target/generated/completions/$_cmd.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_cmd.fish"
  install -Dm644 "target/generated/completions/_$_cmd" "$pkgdir/usr/share/zsh/site-functions/_$_cmd"

  for file in target/generated/manpage/"$_cmd"*.1; do
    install -Dm644 "$file" "$pkgdir/usr/share/man/man1/$(basename "$file")"
    gzip "$pkgdir/usr/share/man/man1/$(basename "$file")"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
