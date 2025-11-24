pkgname=justevery-code
pkgver=0.5.2
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
b2sums=('e5c7fee22310785e759fc05ec964d9253a461dc5c2309fa0f02c093ca89347fbcbaf2e73fd0ef72f7233ba08847ad23d93a884989f0d11fe2133432b4e621237')

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
	install -Dm644 "../NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
