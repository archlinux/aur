# Maintainer: Michael S. <sandersm689@gmail.com>
pkgname=glogout
pkgver=1.0.0
pkgrel=1
pkgdesc="A Wayland logout menu themed with real HTML, CSS, and JavaScript — no GTK theme inheritance"
arch=('x86_64')
url="https://github.com/synnode/glogout"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'webkitgtk-6.0')
makedepends=('cargo')
optdepends=('systemd: for the glogout daemon user service (contrib/glogout.service)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3fe986c1816dc4e8ec2e05a69a2706b634867dbe87c64c831eacedb08f90ebf')

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

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 contrib/glogout.service "$pkgdir/usr/lib/systemd/user/glogout.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
