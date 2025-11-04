# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=openai-codex
pkgver=0.55.0
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
b2sums=('e83e51f01b49bd35bd3f26b5660c2b9c2d497665de0f51eebe8b0a977e6596b75126743cc4c3c4eca88e023eb9643b6b58dbea83ed738aa2e1b95cb7bf0b7788')

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

	# Only build needed packages to save on build time.
	# Skip dev dependencies like *_test_support.
	cargo build --release --frozen -p codex-cli -p codex-exec -p codex-linux-sandbox
}

# check() omitted - there seems to be some irrelevant test failures

package() {
    cd "codex-rust-v${pkgver}/codex-rs"

    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/codex"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/codex-exec"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/codex-linux-sandbox"
}
