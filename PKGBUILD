# Maintainer: Humblemonk <humblemonk@gmail.com>

pkgname=shurectl
pkgver=2.18.1
pkgrel=1
pkgdesc='TUI configurator for Shure MOTIV USB audio interfaces and microphones'
arch=('x86_64' 'aarch64')
url='https://github.com/Humblemonk/shurectl'
license=('GPL-3.0-only')
depends=('libgcc' 'glibc' 'alsa-lib' 'systemd-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7020257717b17a0ce438baa73a53c8e130305cb90d840d27967c07a8034fac27')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
	export CARGO_TARGET_DIR=target
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/lib/udev/rules.d/" 62-shure.rules
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
