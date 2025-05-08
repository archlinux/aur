# Maintainer: Shane Blackthorne <arch@blackthorne.dev>
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname="hackernews_tui"
_gitname="hackernews-TUI"
pkgver="0.13.5"
pkgrel=1
pkgdesc="A Terminal UI to browse hacker news."
arch=("x86_64")
url="https://github.com/aome510/hackernews-TUI"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b2d93e83f88d56bf45db789582c0f4f67ef4fd70202e048bfec82c6a93fc4b5d12316ac50cb96daba89f8969c58d53e7c8a5cfbe60b72dee8f66a5a9c5ab5eb9')
# disable LTO until ring can be built with it: https://github.com/briansmith/ring/issues/1444
options=(!lto)

prepare() {
	cd "${_gitname}-$pkgver"
	
	export RUSTUP_TOOLCHAIN=stable
	
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${_gitname}-$pkgver" 

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	
	cargo build --frozen --release --all-features
}

check() {
	cd "${_gitname}-$pkgver"

	export RUSTUP_TOOLCHAIN=stable

	cargo test --frozen --workspace
}

package() {
	cd "${_gitname}-$pkgver"

	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md" "docs/config.md"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" "examples/hn-tui.toml"
}
