pkgname=systemd-lsp

: "${_fragment:=tag=v2026.01.06}"

pkgver=2026.01.06
pkgrel=1

pkgdesc='A language server implementation for systemd unit files made in rust'
url=https://github.com/JFryy/systemd-lsp

arch=(x86_64 aarch64)
license=(MIT)

makedepends=(git cargo)

source=("git+$url.git#$_fragment")
sha256sums=('3022efd56b0ed4e165e11c0c5aea94fa3a43ceb5336bbf22e18f7a2934633703')

pkgver() {
	git -C "$pkgname" describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path "$pkgname/Cargo.toml"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --manifest-path "$pkgname/Cargo.toml"
}

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
	install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
