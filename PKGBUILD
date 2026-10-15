# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>
pkgname=cpyref
pkgver=0.4.0
pkgrel=1
pkgdesc='Local references, bounded test logs and source snapshots for AI agents'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/cpyref'
license=('LicenseRef-AUL-1.0-draft.1')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d08dae150afb66c1af9430aae6bafae7d7c162492c308420966b75bd15eb1596')

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
  install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  for file in LICENSE LICENSE.MIT AGENTS.md UPSTREAM.toml; do
    install -Dm644 "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/docs"
  install -m644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/docs/"
  install -Dm644 skills/cpyref/SKILL.md "$pkgdir/usr/share/doc/$pkgname/skills/cpyref/SKILL.md"
  install -Dm644 skills/cpyref/agents/openai.yaml "$pkgdir/usr/share/doc/$pkgname/skills/cpyref/agents/openai.yaml"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/examples"
  install -m644 examples/project.toml examples/shared.toml "$pkgdir/usr/share/doc/$pkgname/examples/"
  # Older source archives may not include the optional integration example.
  if [[ -f examples/agentgc-handoff.sh ]]; then
    install -Dm755 examples/agentgc-handoff.sh "$pkgdir/usr/share/doc/$pkgname/examples/agentgc-handoff.sh"
  fi
}
