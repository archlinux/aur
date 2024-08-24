# Maintainer: Leon Richardt <aur [at] leon [dot] dev>
pkgname=sway-overfocus
pkgver=v0.2.4
pkgrel=1
pkgdesc='"Better" focus navigation for sway and i3'
arch=('x86_64')
url="https://github.com/korreman/sway-overfocus"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/korreman/$pkgname/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha512sums=('14e561fe6819f841492e6d86088f85155b2c80733784e79952cfc5ce2ce09f7433adc4b9b70115d97760ef1c78b77c2ea4eff6b53ffd683b7f374f9b37117895')


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
