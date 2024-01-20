# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=keyboard-backlightd-git
pkgver=0.1.7.r15.de04764
pkgrel=1
pkgdesc="Automatic keyboard backlight management on Thinkpads"
arch=(x86_64)
url="https://github.com/VorpalBlade/keyboard-backlightd"
license=('GPL-3.0-only')
depends=(libevdev)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(cargo git)
backup=(etc/conf.d/keyboard-backlightd)
source=("${pkgname%-git}::git+https://github.com/VorpalBlade/${pkgname%-git}.git")
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make CARGO_FLAGS="--frozen --all-features"
}

check() {
    cd "$srcdir/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" PREFIX=/usr ETCDIR=/etc install
}
