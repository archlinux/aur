# Maintainer: Denys Sedchenko <aur@x1unix.dev>
pkgname=codex-acp
pkgver='v0.2.2'
pkgrel=1
pkgdesc="ACP–compatible agent that bridges the OpenAI Codex runtime with ACP clients."
arch=('x86_64' 'aarch64')
url="https://github.com/cola-io/codex-acp"
license=('Apache-2.0')
provides=('codex-acp')
conflicts=('codex-acp')
depends=(
  'openai-codex'
)
makedepends=(
  'cargo'
)
optdepends=()
options=('!lto')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/codex-acp"
  git rev-list --count HEAD | sed 's/^/r/'
}

prepare() {
  cd 'codex-acp'

  # NOTE: rustup toolchain is declared at 'rust-toolchain.toml' in upstream.
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd 'codex-acp'

  # NOTE: rustup toolchain is declared at 'rust-toolchain.toml' in upstream.
  export CARGO_TARGET_DIR=target

  cargo build --release
}

package() {
  cd 'codex-acp'

  install -Dm755 -t "${pkgdir}/usr/bin" 'target/release/codex-acp'
}
