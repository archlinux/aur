# Maintainer: Grigory Romodanovskiy
pkgname=claude-codex-proxy-git
pkgver=r9.3258c6d
pkgrel=1
pkgdesc='Local Anthropic relay that replaces Claude models with GPT models via Codex'
arch=('x86_64')
url='https://github.com/greg2010/claude-codex-proxy'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
# ring's C objects are gcc-LTO bitcode under makepkg's default lto option,
# which rust-lld cannot link.
options=(!lto)
provides=('claude-codex-proxy')
conflicts=('claude-codex-proxy')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  timeout 300 cargo test --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 'target/release/claude-codex-proxy' "$pkgdir/usr/bin/claude-codex-proxy"
  install -Dm755 'scripts/claudex' "$pkgdir/usr/bin/claudex"
  install -Dm644 'packaging/arch/claude-codex-proxy.socket' "$pkgdir/usr/lib/systemd/user/claude-codex-proxy.socket"
  install -Dm644 'packaging/arch/claude-codex-proxy.service' "$pkgdir/usr/lib/systemd/user/claude-codex-proxy.service"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
