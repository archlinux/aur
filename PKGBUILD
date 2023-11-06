# Maintainer: Lucas Melo <luluco250 at gmail dot com>
# Contributor: Maya Matuszczyk <maccraft123mc at gmail dot com>
# shellcheck disable=SC2148,SC2034,SC2154

_base_pkgname=ayaled
pkgname=${_base_pkgname}-updated
pkgver=0.6.2
_source_archive=${_base_pkgname}-$pkgver
pkgrel=1
pkgdesc="A daemon to manage joystick LEDs on AYANEO devices, updated fork."
url="https://github.com/luluco250/$_base_pkgname"
arch=('x86_64')
license=('custom:BSD-4-Clause')
makedepends=('cargo')
source=(
	"$_source_archive.tar.gz::https://github.com/luluco250/$_base_pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
	'd3e320ffa0fde7c822dfc7798d1bfb0bdf1a16f915097649b5ebefd557068242'
)

prepare() {
	cd "$srcdir/$_source_archive" || exit 1
	
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_source_archive" || exit 1

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/$_source_archive" || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/$_source_archive" || exit 1

	install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_base_pkgname"
	install -Dm644 "src/$_base_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_base_pkgname.service"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_base_pkgname/BSD-4-Clause.txt"
}
