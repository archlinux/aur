# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Maintainer: Callum Andrew <contact@candrew.net>

pkgname=shotman
pkgver=0.4.7
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
sha512sums=('59865c367b6648fff56a0c04b6373f3fb403816a7997edd34b4109eff5a2fe463ff2494a82648dbf842108275cb462525b7ab87539729a4eba4f0e36b448b395')

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
