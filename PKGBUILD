# Maintainer: Leon Richardt <aur [at] leon [dot] dev>
pkgname=sway-overfocus
pkgver=v0.2.5
pkgrel=1
pkgdesc='"Better" focus navigation for sway and i3'
arch=('x86_64')
url="https://github.com/korreman/sway-overfocus"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/korreman/$pkgname/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha512sums=('466418e828e33893f195de907c996f134fee622151013de3d13cfdde011abfed8f15e430e5854a50d6bd7d3b151b1d24da08bbf8c99dc317e1b57a811095fdc0')


# Not sure why, but the source directory inside $srcdir loses the "v" tag prefix.
# Thus we need to strip the prefix ourselves.
strip_pkgver=$(echo "${pkgver//_/-}" | sed "s/^v//")

prepare() {
    cd "$srcdir/$pkgname-$strip_pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$strip_pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$strip_pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
