# Maintainer: Humblemonk <humblemonk@gmail.com>

pkgname=rogctl
pkgver=2.6.0
pkgrel=1
pkgdesc='Battery status, settings and panel widgets for ASUS mice'
arch=('x86_64' 'aarch64')
url='https://github.com/humblemonk/rogctl'
license=('AGPL-3.0-or-later')
depends=('libgcc' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('690688205f20edbe8f9b4a443733470f53a1df27ba90c2abb959d36f215abef7')

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
	install -Dm0644 -t "$pkgdir/usr/lib/udev/rules.d/" udev/70-rogctl.rules
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md docs/*.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
