pkgname=systemd-lsp

: "${_fragment:=tag=v2026.01.17}"

pkgver=2026.01.17
pkgrel=1

pkgdesc='A language server implementation for systemd unit files made in rust'
url=https://github.com/JFryy/systemd-lsp

arch=(x86_64 aarch64)
license=(MIT)

makedepends=(git cargo)

source=("git+$url.git#$_fragment")
sha256sums=('9dea093e695cbb32fec7e31de37ffaba1cb5bc8a258799fab193dac893b0e876')

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
