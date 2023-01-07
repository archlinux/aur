# Maintainer: Aiden Langley <aiden at nedia.dev>

pkgname=nedots
pkgdesc="A tool to manage configuration files/(ne)dots."
url="https://git.sr.ht/~nedia/nedots.rs"
arch=("x86_64")
license=("MIT")
pkgver=0.1.5
pkgrel=1
source=("nedots.rs-0.1.5.tar.gz::$url/archive/$pkgver.tar.gz")
makedepends=("cargo")
provides=("nedots")
sha256sums=("ffef5dc141b61907a7878c1166ddb253cbbb894b24b100c1b55df5091f1f4768")

cd_src() {
	cd "nedots.rs-$pkgver" || return
}

check() {
	cd_src

	export RUSTUP_TOOLCHAIN=stable
	cargo test
}

build() {
	cd_src

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release

	for shell in bash zsh fish; do
		./target/release/nedots completions $shell >"target/release/nedots-completions.$shell"
	done
}

package() {
	cd_src

	install -Dm 755 "target/release/nedots" -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 target/release/nedots-completions.bash "$pkgdir/usr/share/bash-completion/completions/nedots"
	install -Dm 644 target/release/nedots-completions.zsh "$pkgdir/usr/share/zsh/site-functions/_nedots"
	install -Dm 644 target/release/nedots-completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/nedots.fish"
}
