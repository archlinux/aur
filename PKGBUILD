# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
_pkgname=pi_agent_rust
pkgbase=pi-agent-rust
pkgname=('pi-agent-rust' 'pi-rust')
pkgver=0.4.0
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
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ffeb83546c9f9ee9f0e0e5c9e681a598297efd5601c359a07089062918b414a')
# The vendored QuickJS and tree-sitter break with LTO, so disabling it
options=(!lto)

prepare() {
  cd "$_pkgname-$pkgver"
  rustup toolchain install
  cargo fetch --locked
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked --bin pi
}

package_pi-agent-rust() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/pi "$pkgdir/usr/bin/pi-rust"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pi-rust() {
  cd "$_pkgname-$pkgver"
  depends+=('pi-agent-rust')
  provides=('pi')
  conflicts=('pi')
  replaces=('pi')
  mkdir -p "$pkgdir/usr/bin"
  ln -sv /usr/bin/pi-rust "$pkgdir/usr/bin/pi"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
