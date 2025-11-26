# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=meli
pkgver=0.8.12
pkgrel=1
pkgdesc='A MUA for the terminal aiming for configurability and extensibility with sane defaults'
arch=(x86_64)
url=https://meli.delivery/
license=(GPL-3.0-only)
depends=(dbus-glib
         gcc-libs
         glibc)
makedepends=(cargo
             mandoc)
source=("$pkgname-$pkgver.tag.gz::https://git.meli.delivery/meli/meli/archive/v$pkgver.tar.gz")
sha256sums=('6f03f50b7e3ee29d34716f31d77e75eca72ab651d67ea1de2dffc5813565180f')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
	cargo build --frozen --release --features dbus-notifications,jmap
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/meli
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" meli/docs/meli.1
	install -Dm0644 -t "$pkgdir/usr/share/man/man5/" meli/docs/meli.conf.5
	install -Dm0644 -t "$pkgdir/usr/share/man/man5/" meli/docs/meli-themes.5
}
