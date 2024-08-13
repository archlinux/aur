# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=meli
pkgver=0.8.7
pkgrel=1
pkgdesc='A MUA for the terminal aiming for configurability and extensibility with sane defaults'
arch=(x86_64)
url=https://meli.delivery/
license=(GPL-3.0-only)
depends=(dbus-glib)
makedepends=(cargo
             mandoc)
source=("$pkgname-$pkgver.tag.gz::https://git.meli.delivery/meli/meli/archive/v$pkgver.tar.gz")
sha256sums=('3d7067ec336c58f96c6c1ebaf7a7817a86dbc40cf2133114b1788a10088bdbc2')

prepare() {
	cd "$pkgname"
	# Upstream pinned dependencies don't build on 1.80
	cargo update
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --features dbus-notifications,jmap
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/meli
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" meli/docs/meli.1
	install -Dm0644 -t "$pkgdir/usr/share/man/man5/" meli/docs/meli.conf.5
	install -Dm0644 -t "$pkgdir/usr/share/man/man5/" meli/docs/meli-themes.5
}
