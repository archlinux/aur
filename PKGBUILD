# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=meli
pkgver=0.8.4
pkgrel=1
pkgdesc='A MUA for the terminal aiming for configurability and extensibility with sane defaults'
arch=(x86_64)
url=https://meli.delivery/
license=(GPL)
depends=(dbus-glib)
makedepends=(cargo
             mandoc)
source=("$pkgname-$pkgver.tag.gz::https://git.meli.delivery/meli/meli/archive/v$pkgver.tar.gz")
sha256sums=('85ab278137c91f14a8bf6a5331dd3dd971e8d14e27929f54c8f1244020f8b836')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --features dbus-notifications,jmap
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/meli
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" meli/docs/meli.1
	install -Dm0644 -t "$pkgdir/usr/share/man/man5/" meli/docs/meli.conf.5
	install -Dm0644 -t "$pkgdir/usr/share/man/man5/" meli/docs/meli-themes.5
}
