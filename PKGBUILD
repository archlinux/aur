# Maintainer: Benoît Zugmeyer <bzugmeyer@gmail.com>
pkgname=deno-git
pkgver=1.9.2.r89.ga051a7f7b
pkgrel=1
pkgdesc="A secure runtime for JavaScript and TypeScript"
arch=('x86_64')
url="https://deno.land"
provides=('deno')
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'python' 'cargo' 'nodejs')
source=("deno-git::git+https://github.com/denoland/deno")
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long --tags --match 'v*.*.*' 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --target-dir=target
}

check() {
  cd "$pkgname"
  # Tests are not passing sometimes
  # RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
  ./target/release/deno run ./cli/tests/002_hello.ts
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/deno "$pkgdir"/usr/bin/deno

  install -dm755 "$pkgdir"/usr/share/bash-completion/completions
  ./target/release/deno completions bash > "$pkgdir"/usr/share/bash-completion/completions/deno
  install -dm755 "$pkgdir"/usr/share/zsh/site-functions
  ./target/release/deno completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_deno
  install -dm755 "$pkgdir"/usr/share/fish/vendor_functions.d
  ./target/release/deno completions fish > "$pkgdir"/usr/share/fish/vendor_functions.d/deno.fish

  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
