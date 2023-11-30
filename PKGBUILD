# Maintainer: dadav <dadav at protonmail dot com>

pkgname=battery-notify
pkgver=0.3.3
pkgrel=1
pkgdesc='A simple battery notifier for Linux.'
arch=('x86_64')
url='https://github.com/cdown/battery-notify'
license=('MIT')
makedepends=('git' 'cargo')
provides=("battery-notify=$pkgver")
conflicts=("battery-notify-git")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname" || exit
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd "$pkgname" || exit
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable

	cd "$pkgname" || exit
	cargo test --frozen --all-features --release
}

package() {
	cd "$pkgname" || exit
	install -Dm755 battery-notify.service -t "$pkgdir/usr/lib/systemd/user/"
	install -D target/release/battery-notify -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
