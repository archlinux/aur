# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=systemfd
pkgver=0.4.2
pkgrel=1
epoch=
pkgdesc="auto reloading for projects supporting systemd socket activation"
arch=(i686 x86_64 armv6h armv7h)
url="https://github.com/mitsuhiko/systemfd"
license=(Apache-2.0)
groups=()
depends=(glibc gcc-libs)
makedepends=(cargo)
checkdepends=()
optdepends=()
provides=(systemfd)
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitsuhiko/$pkgname/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha512sums=('5fb9ab89f27ffd5bd0f2cc45f0a5df2bc8620abf47ddf92ceeca83585df3e3756694a823bef5dcb5e4021f7abb810473b85d2fa94fba5d3c7ce960d8ce47e91b')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --offline # XXX remove next release
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
