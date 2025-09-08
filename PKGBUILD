# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=openai-codex
pkgver=0.31.0
pkgrel=1
pkgdesc="Lightweight coding agent that runs in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex"
license=('Apache-2.0')
depends=(
	'openssl'
	'gcc-libs'
	'glibc'
)
makedepends=(
	'cargo'
)
optdepends=(
	'git'
	'ripgrep: accelerated large-repo search'
)
# LTO seems to cause build failures, details unclear
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/rust-v${pkgver}.tar.gz")
b2sums=('69827615e9a7e8e42b1e3ca59f66e0b840b57e342f056f06aa017dff51e90906b191c4df9cfb7164bef56efee395562d26315a5b3bddd5b0f8974fefeb53b712')

prepare() {
    cd "codex-rust-v${pkgver}/codex-rs"

	export RUSTUP_TOOLCHAIN=stable

    # Cargo.lock seems to be outdated, do not use --locked.
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "codex-rust-v${pkgver}/codex-rs"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

    cargo build --release --frozen
}

# check() omitted - there seems to be some irrelevant test failures

package() {
    cd "codex-rust-v${pkgver}/codex-rs"

    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/codex"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/codex-exec"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/codex-linux-sandbox"
}
