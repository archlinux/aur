# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=openai-codex-reasoning
pkgver=0.124.0
pkgrel=1
pkgdesc="OpenAI Codex CLI fork with inline reasoning traces"
arch=('x86_64' 'aarch64')
url="https://github.com/OneNoted/codex"
license=('Apache-2.0')
depends=(
  'openssl'
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cargo'
  'git'
)
optdepends=(
  'git: built-in PR helpers'
  'ripgrep: accelerated large-repo search'
)
provides=('openai-codex')
conflicts=(
  'openai-codex'
  'openai-codex-bin'
)
options=('!lto')

_fork_tag='aur-v0.124.0-reasoning.1'
_source_dir='codex'
source=(
  "${_source_dir}::git+https://github.com/OneNoted/codex.git#tag=${_fork_tag}"
)
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_source_dir}/codex-rs"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_source_dir}/codex-rs"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --release --locked \
    -p codex-cli \
    -p codex-exec \
    -p codex-linux-sandbox
}

package() {
  cd "${srcdir}/${_source_dir}/codex-rs"

  install -Dm755 target/release/codex "${pkgdir}/usr/bin/codex"
  install -Dm755 target/release/codex-exec "${pkgdir}/usr/bin/codex-exec"
  install -Dm755 target/release/codex-linux-sandbox \
    "${pkgdir}/usr/bin/codex-linux-sandbox"
  install -Dm644 "${srcdir}/${_source_dir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
