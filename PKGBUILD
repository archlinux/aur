# Maintainer: Lexi <@alexis@foxgirl.land> (a fediverse address)

pkgname=catgirl-engine
pkgdesc="A game engine for cool moddability and procedurally generated data"
arch=('any')
url="https://github.com/lexi-the-cute/catgirl-engine"
license=(Zlib)
pkgver=0.14.4
pkgrel=26
conflicts=(catgirl-engine-git)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=("SKIP")
options=(!strip !debug)
makedepends=(
    "rustup"
    "cargo-nightly"
    "sed"
)
optdepends=(
    "wayland: Graphics display server"
    "xorg-server: Graphics display server"
)

# Generated in accordance to https://wiki.archlinux.org/title/Rust_package_guidelines.
# Might require further modification depending on the package involved.
prepare() {
    cd "$pkgname-$pkgver"
    rustup install nightly
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTFLAGS="-L/usr/lib -lzstd"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=nightly
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    sed -i "s/\${engine_path}/\/usr\/bin\/$pkgname/" $pkgname.desktop
    mv logo.png $pkgname.png

    install -Dm0755 -t "$pkgdir/usr/share/icons/" "$pkgname.png"
    install -Dm0755 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}