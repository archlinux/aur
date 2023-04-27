# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=keyboard-backlightd
pkgver=0.1.5
pkgrel=1
pkgdesc="Automatic keyboard backlight management on Thinkpads"
arch=(x86_64)
url="https://github.com/VorpalBlade/keyboard-backlightd"
license=('GPL3')
depends=(libevdev)
makedepends=(cargo)
backup=(etc/conf.d/keyboard-backlightd)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('c352b815da671fd1cc52227c2ba4b15eeea9488ac7902dda77c908693beec7b9')

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
