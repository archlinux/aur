# Maintainer: Jia Yin<yenfeng.shetiko at gmail dot com>

pkgname=kixdns-git
pkgver=r69.254b222
pkgrel=1
pkgdesc='A DNS forwarder built using RUST.'
arch=('x86_64')
url="https://github.com/olicesx/kixdns"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=('kixdns')
provides=("kixdns=${pkgver}")
source=("$pkgname::git+$url")
sha512sums=('SKIP')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" target/release/kixdns
}
