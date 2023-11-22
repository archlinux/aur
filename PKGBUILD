# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=meli
pkgver=0.8.3
pkgrel=1
pkgdesc='A MUA for the terminal aiming for configurability and extensibility with sane defaults'
arch=(x86_64)
url=https://meli.delivery/
license=(GPL)
depends=(dbus-glib)
makedepends=(cargo
             mandoc)
source=("$pkgname-$pkgver.tag.gz::https://git.meli.delivery/meli/meli/archive/v$pkgver.tar.gz")
sha256sums=('379d0c6a8db5a0d010eb8396c5b0872bead7827403310411943783f51d0ac15b')

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
