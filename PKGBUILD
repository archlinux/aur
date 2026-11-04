# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=libredj
pkgver=0.9.0
pkgrel=3
pkgdesc="DJ software for Linux."
arch=('x86_64')
url="https://codeberg.org/OpenDJLab/LibreDJ"
license=('GPL-3.0-only')
groups=(pro-audio)
depends=(
	jack
)
makedepends=(cargo-nightly)
source=("${pkgname}-${pkgver}.zip::https://codeberg.org/OpenDJLab/LibreDJ/archive/v${pkgver}.zip")
sha256sums=('880a51c8f6b2be7af1c1e24725fc1bfee83a7520f4b9df826ff79ff7eed215f9')

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=nightly
	cargo update
	cargo fetch --locked --target host-tuple
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
	# Some features failing to build, see https://codeberg.org/OpenDJLab/LibreDJ/issues/261
	# --all-features
}

package() {
	install -Dm0755 "$srcdir/$pkgname/target/release/gui" "$pkgdir/usr/bin/libredj"
}

# vim:set ts=2 sw=2
