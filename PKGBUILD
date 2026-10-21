# Maintainer: mustd
pkgname=mdpkg
pkgver=0.2.0
pkgrel=1
pkgdesc="Declarative multi-host package manager for Manjaro Linux via Markdown checklists"
arch=('x86_64' 'aarch64')
url="https://github.com/MustD/mdpkg"
license=('MIT')
depends=('pacman' 'pamac-cli' 'sudo')
optdepends=('npm: for global npm package management')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a2382f192fa42326316215d33280100c906bdaa8dd67f9bc22b6b8e77897e1f4')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  "target/release/$pkgname" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  "target/release/$pkgname" completions zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  "target/release/$pkgname" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
