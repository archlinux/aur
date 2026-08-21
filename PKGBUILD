# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
_pkgname=pi_agent_rust
pkgname=pi-agent-rust
pkgver=0.1.23
pkgrel=1
pkgdesc="High-performance AI coding agent CLI - Rust port of Pi Agent"
arch=('x86_64' 'aarch64')
url="https://github.com/Dicklesworthstone/pi_agent_rust"
license=('LicenseRef-MIT-wit-LLM-rider')
depends=('glibc' 'gcc-libs' 'sqlite')
makedepends=('rustup' 'pkg-config')
optdepends=(
  'tmux: for background bash capabilities'
  'fd: system-provided backend for the find tool'
  'ripgrep: system-provided backend for the grep tool'
)
provides=('pi')
conflicts=('pi')
replaces=('pi')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('35e25f33c8b2e0618a89d4283b8ad604846d893e306013589f0f99d6c3827bad')
# The vendored QuickJS and tree-sitter break with LTO, so disabling it
options=(!lto)

prepare() {
  cd "$_pkgname-$pkgver"
  rustup toolchain install nightly-2026-07-05
  cargo fetch --locked
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked --bin pi
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/pi "$pkgdir/usr/bin/pi"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
