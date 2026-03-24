pkgname=justevery-code
pkgver=0.6.83
pkgrel=1
pkgdesc="Community-driven fork of the Codex CLI for local terminal coding assistance"
arch=('x86_64' 'aarch64')
url="https://github.com/just-every/code"
license=('Apache-2.0')
depends=(
	'openssl'
	'gcc-libs'
	'glibc'
)
makedepends=('cargo')
optdepends=(
	'git'
	'ripgrep: accelerated large-repo search'
	'chromium: connect external browser sessions via /chrome'
	'claude-code: integrate with the Claude Caude CLI agent'
	'gemini-cli: connect to the Google Gemini terminal client'
	'codanna: share context with the Codanna code-awareness agent'
)
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e4f5789a570af1750fad729e436e33500ca611851911d497f831a5952995165888a88ff972083c3b78f3d26c938dc0ab1b962ca4445003d7f6f220a0f4ce6d7f')

prepare() {
	cd "code-${pkgver}/code-rs"

	export CARGO_HOME="${srcdir}/cargo-home"
	mkdir -p "${CARGO_HOME}"
	export RUSTUP_TOOLCHAIN=stable
	export CODE_VERSION="${pkgver}"

	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "code-${pkgver}/code-rs"

	export CARGO_HOME="${srcdir}/cargo-home"
	mkdir -p "${CARGO_HOME}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CODE_VERSION="${pkgver}"

	cargo build --release --frozen
}

package() {
	cd "code-${pkgver}/code-rs"

	install -Dm755 "target/release/code" "${pkgdir}/usr/bin/coder"
	install -Dm755 "target/release/code-exec" "${pkgdir}/usr/bin/code-exec"
	install -Dm755 "target/release/code-linux-sandbox" "${pkgdir}/usr/bin/code-linux-sandbox"

	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
