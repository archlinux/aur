# Maintainer: Humblemonk <humblemonk@gmail.com>

pkgname=rogctl
pkgver=2.2.0
pkgrel=1
pkgdesc='Battery status, settings and panel widgets for ASUS mice'
arch=('x86_64' 'aarch64')
url='https://github.com/humblemonk/rogctl'
license=('AGPL-3.0-or-later')
depends=('libgcc' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('311d329bf6d43df7423433750691970f5b3657e056d52fa6bd84ace3556c5578')

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
