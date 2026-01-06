# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Jan Holthuis <jan.holthuis@ruhr-uni-bochum.de>

pkgname=litra
pkgver=2.5.1
pkgrel=2
pkgdesc="CLI and library to control Logitech Litra Glow, Beam and Beam LX lights"
arch=(x86_64 aarch64)
url="https://github.com/timrogers/litra-rs"
license=('MIT')
makedepends=(cargo)
depends=(
  glibc
  gcc-libs
  systemd-libs
  hidapi
)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('7946a5ca2a79c9f4ca078c859d9bdb9d993092734baa8f2063f63783e409acbc')
install=litra.install

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Link against system hidapi-hidraw
    export RUSTFLAGS="-C link-arg=-lhidapi-hidraw"
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C link-arg=-lhidapi-hidraw"
    # Skip doctests which have linking issues with hidapi
    cargo test --frozen --all-features --lib --bins
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE.md"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "README.md"

    # Install udev rules to a neutral location; .install script will copy if needed
    install -Dm0644 "99-litra.rules" "$pkgdir/usr/share/$pkgname/99-litra.rules"
}
