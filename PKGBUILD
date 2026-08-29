# Maintainer: rotkonetworks <hq@rotko.net>
# PGP: 813CE099D6CE512BC29A15D841EE1853489958D6

pkgname=nocb
pkgver=1.2.0
pkgrel=1
pkgdesc="x11 clipboard manager with compression and fts"
arch=('x86_64')
url="https://github.com/rotkonetworks/nocb"
license=('MIT')
# rusqlite's bundled sqlite3 does not survive makepkg's default LTO: the C
# objects are dropped and sqlite3_* symbols come up undefined at link time.
options=(!lto)
depends=('gcc-libs')
makedepends=('cargo' 'git')
install=nocb.install
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "x86_64-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/nocb" "$pkgdir/usr/bin/nocb"
	install -Dm644 nocb.service "$pkgdir/usr/lib/systemd/user/nocb.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
