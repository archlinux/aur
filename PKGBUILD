# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Maintainer: Callum Andrew <contact@candrew.net>

pkgname=shotman
pkgver=0.5.0
pkgrel=1
pkgdesc="Uncompromising screenshot GUI for Wayland"
arch=("x86_64" "aarch64")
url="https://git.sr.ht/~whynothugo/shotman"
license=('ISC')
depends=("libxkbcommon")
optdepends=(
    "sway: screenshots of a single window on swaywm"
    "slurp: screenshots of a region on swaywm"
)
makedepends=("cargo" "scdoc")
source=("shotman-v$pkgver.tar.gz::https://git.sr.ht/~whynothugo/shotman/archive/v$pkgver.tar.gz")
sha512sums=('aa0c69232a41b28398000202fb213e83f8fbc1c8b946e3b08f0dbfafd98388ed84023ea0c1fb557734084a73077aa245f2db4b83ba81ee3991549f4b67efb769')

prepare() {
    cd "$srcdir/$pkgname-v$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make build
}

check() {
    cd "$srcdir/$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"

    DESTDIR="$pkgdir" PREFIX="/usr" make install --trace
}
