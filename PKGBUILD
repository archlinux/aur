# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=cpyref
pkgver=0.1.1
pkgrel=1
pkgdesc='Copy exact bytes once and paste them by a short reference, for AI agents'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/cpyref'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('b4bafb1a3e97c895c717fb740f22c8e487fcfb4acab6fa0ac31b77d4fa21f887')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | awk '/^host:/ {print $2}')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --all-targets
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/cpyref "$pkgdir/usr/bin/cpyref"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/docs"
  install -m644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/docs/"
  install -Dm644 skills/cpyref/SKILL.md "$pkgdir/usr/share/doc/$pkgname/skills/cpyref/SKILL.md"
  install -Dm644 skills/cpyref/agents/openai.yaml "$pkgdir/usr/share/doc/$pkgname/skills/cpyref/agents/openai.yaml"
}
