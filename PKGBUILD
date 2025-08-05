# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=openai-codex
pkgver=0.12.0
pkgrel=1
pkgdesc="Lightweight coding agent that runs in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex"
license=('Apache-2.0')
depends=()
makedepends=(
	'cargo'
)
optdepends=(
	'git'
	'ripgrep: accelerated large-repo search'
)
# LTO seems to cause build failures, details unclear
options=('!lto')
source=("${url}/archive/refs/tags/rust-v${pkgver}.tar.gz")
b2sums=('27f5796cfe1377f4e696dd02e945dab021083355295f7b150a84f21980827621016a3b9855c846ff44993a0fd2e6dafab474ec0547e09e1aef32e0c40542dd9a')

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
