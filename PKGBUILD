# Maintainer: Leon Richardt <leon.richardt@gmail.com>
pkgname=sway-overfocus
pkgver=v0.2.3
pkgrel=1
pkgdesc='"Better" focus navigation for sway and i3'
arch=('x86_64')
url="https://github.com/korreman/sway-overfocus"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/korreman/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('ad984c8f00274ca5965d3959c97d79f2d73045201306a77545857beda0f5fde3f75cdd501fbf4d141ad71f2a6b81ea4ea044554fb752c871ad8de4867233df17')

# Not sure why, but the source directory inside $srcdir loses the "v" tag prefix.
# Thus we need to strip the prefix ourselves.
strip_pkgver=$(echo "$pkgver" | sed "s/^v//")

prepare() {
    cd "$srcdir/$pkgname-$strip_pkgver"

    # "Fix" outdated version number in Cargo.lock using multi-line sed matching
    sed -i '/^name = "sway-overfocus"$/{N;s/0.2.2/0.2.3/}' Cargo.lock

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
