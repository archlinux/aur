# Maintainer: Jack Mahoney <jacksmahoney@gmail.com>
pkgname=openai-codex-git
pkgver=r543
pkgrel=2
pkgdesc="Lightweight coding agent that runs in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex"
license=('Apache-2.0')
provides=('openai-codex')
conflicts=('openai-codex')
depends=()
makedepends=(
	'cargo'
)
optdepends=(
	'git: for working with git repositories'
	'ripgrep: accelerated large-repo search'
)
options=('!lto')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd "$srcdir/codex"
	git rev-list --count HEAD | sed 's/^/r/'
}

prepare() {
	cd "codex/codex-rs"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "codex/codex-rs"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cargo build --release --frozen
}

package() {
	cd "codex/codex-rs"

	install -Dm755 -t "${pkgdir}/usr/bin" "target/release/codex"
	install -Dm755 -t "${pkgdir}/usr/bin" "target/release/codex-exec"
	install -Dm755 -t "${pkgdir}/usr/bin" "target/release/codex-linux-sandbox"
}
