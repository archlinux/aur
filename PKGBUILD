# Maintainer: steelt <steeltitanium1 at gmail dot com>
# Contributor: Alex Macleod <alex@macleod.io>

pkgname=findpkg-git
pkgver=1.0.0.r3.g6dcc809
pkgrel=2
pkgdesc="A fast command not found hook"
arch=('x86_64')
url="https://github.com/Alexendoo/findpkg"
license=('MIT')
depends=('pacman')
makedepends=('git' 'cargo')
provides=('findpkg')
conflicts=('findpkg')
install="${pkgname%-git}.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features
}

check() {
	cd "$pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -D target/release/findpkg -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 systemd/* -t "$pkgdir/usr/lib/systemd/system/"
}
