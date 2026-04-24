pkgname=magika

pkgver=1.1.0
pkgrel=1

pkgdesc='Fast and accurate AI powered file content types detection'
url="https://github.com/google/$pkgname"

arch=(x86_64 aarch64)
license=(Apache-2.0)

depends=(glibc gcc-libs)
makedepends=(git cargo)

conflicts=(magika-cli)
provides=(magika-cli)

source=("git+$url.git#tag=cli/v$pkgver")
sha256sums=('5daa21e25cbeb8a796a87794a6e5bf9738d3054b6092a04e76cf301dbddc4a3c')

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path "$pkgname/rust/cli/Cargo.toml"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --manifest-path "$pkgname/rust/cli/Cargo.toml"
}

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
	install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
