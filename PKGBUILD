pkgname=systemd-lsp

: "${_fragment:=tag=v2025.12.30}"

pkgver=2025.12.30
pkgrel=1

pkgdesc='A language server implementation for systemd unit files made in rust'
url=https://github.com/JFryy/systemd-lsp

arch=(x86_64 aarch64)
license=(MIT)

makedepends=(git cargo)

source=("git+$url.git#$_fragment")
sha256sums=('180b5bf10b40027639c6a7d4db43c40270df7423195ff9f3c9e37ef452a88c2b')

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
