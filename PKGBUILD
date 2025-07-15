pkgname=systemd-lsp

: ${_fragment:=tag=v2025.07.14}

pkgver=2025.07.14
pkgrel=1

pkgdesc='A language server implementation for systemd unit files made in rust'
url=https://github.com/JFryy/systemd-lsp

arch=(x86_64 aarch64)
license=(MIT)

makedepends=(git cargo)

source=("git+$url.git#$_fragment")
sha256sums=('164a23ba0034e2656d6a827601e6e1dc92a7897fae2007c88c00e96a4a5f32ff')

pkgver() {
	git -C "$pkgname" describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
