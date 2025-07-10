pkgname=systemd-lsp

_fragment=tag=v2025.07.10

pkgver=2025.07.10
pkgrel=1

pkgdesc='A language server implementation for systemd unit files made in rust'
url=https://github.com/JFryy/systemd-lsp

arch=(x86_64 aarch64)
license=(MIT)

makedepends=(git cargo)

source=("git+$url.git#$_fragment")
sha256sums=('2d35f03c4eba682bbe36745147a0b4f1fb26d5a1d88bbe51637cabb4f3cb9589')

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
