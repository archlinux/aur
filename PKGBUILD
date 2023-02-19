# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=keyboard-backlightd
pkgver=0.1.0
pkgrel=1
pkgdesc="Automatic keyboard backlight management on Thinkpads"
arch=(x86_64)
url="https://github.com/VorpalBlade/keyboard-backlightd"
license=('GPL3')
depends=(libevdev)
makedepends=(cargo)
backup=(etc/conf.d/keyboard-backlightd)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('10f4cab8a98ea914c0a351b6c16c01532b780b02613c3410fe6dd513756127ee')

prepare() {
	cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make CARGO_FLAGS="--frozen --all-features"
}

check() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr ETCDIR=/etc install
}
