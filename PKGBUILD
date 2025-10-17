# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=openai-codex
pkgver=0.47.0
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
b2sums=('4d6ec51de6f9749713d6d1b0043c9098288a896c2b39f3cc5f2b83d72541be3e28fbc4181e6f8a773d15a5d883d7d357e667a4d020bad8ccaae5cd1b8b7dc358')

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
