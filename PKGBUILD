# Maintainer: Leon Richardt <leon.richardt@gmail.com>
pkgname=sway-overfocus
pkgver=v0.2.3_fix
pkgrel=1
pkgdesc='"Better" focus navigation for sway and i3'
arch=('x86_64')
url="https://github.com/korreman/sway-overfocus"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/korreman/$pkgname/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha512sums=('4ce513a5d1402656b7f6bfbe5d041e7a147e8f7348755f790e9075a29d78e08d98a877ef715249dfb4fd49eafc1bc30ebd2a070776b65f44ea66f9323fc4061e')


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
