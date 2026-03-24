# Maintainer: Marcus Bandit <marcusbanditten@gmail.com>
pkgname=newtree
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern reimagining of the classic tree command with icons, color, and sane pattern filtering"
arch=('x86_64')
url="https://github.com/marcusbandit/newtree"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marcusbandit/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fc21e0e05c17562f8a7eb3381fb446576ca494c8fb5a11c1ecd3f51d75515b1b')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features

  mkdir -p completions
  ./target/release/nt --generate-completions bash > completions/nt.bash
  ./target/release/nt --generate-completions zsh  > completions/_nt
  ./target/release/nt --generate-completions fish > completions/nt.fish
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/nt"               "$pkgdir/usr/bin/nt"
  install -Dm755 "target/release/nt"               "$pkgdir/usr/bin/newtree"
  install -Dm644 LICENSE                            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 completions/nt.bash                "$pkgdir/usr/share/bash-completion/completions/nt"
  install -Dm644 completions/_nt                    "$pkgdir/usr/share/zsh/site-functions/_nt"
  install -Dm644 completions/nt.fish                "$pkgdir/usr/share/fish/vendor_completions.d/nt.fish"
}
