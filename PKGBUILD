# Maintainer: Mark <no@email.com>
_cargoname=daisycalc
_exename=daisy

pkgname=daisy
pkgver=1.1.2
pkgrel=1
pkgdesc="A high-precision terminal scientific calculator."
url="https://git.betalupi.com/Mark/daisy"
license=('GPL')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_cargoname/$_cargoname-$pkgver.crate")
sha1sums=('05e3b77d8278f85cdad1f408c280696d695ebb03')

# Run before commiting:
# Generate checksums: `makepkg -g`
# Generate .SRCINFO: `makepkg --printsrcinfo > .SRCINFO``


prepare() {
	cd "$_cargoname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_cargoname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_cargoname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --release --frozen --all-features
}

package() {
	cd "$_cargoname-$pkgver"
	#mv "target/release/$_cargoname" "target/release/$pkgname"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_exename"
}