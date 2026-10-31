# Maintainer: Antoine Büsch <antoine dot busch at gmail dot com>

pkgname=sinuous
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple TUI for controlling local Sonos speakers"
url="https://github.com/abusch/sinuous"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
# The release profile already strips the binary, so the debug package would be empty.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8449334b8dcd1e6e61ab93763b07caa3a7517b6f4d7e984b29910a4cc8248190')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
