# Maintainer: Tim Lagnese tim@inept.tech

pkgname=pulseshitter
pkgver=3.0.0
pkgrel=5
pkgdesc="Adds audio to your Discord video stream"
arch=('i686' 'x86_64')
url="https://github.com/Enitoni/$pkgname"
license=('MPL2')
depends=(libpulse opus gcc-libs glibc openssl)
makedepends=(cargo)
optdepends=("pulseaudio: For pulseaudio backend", "pipewire: For pipewire backend")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Enitoni/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
    Cargo.toml.patch)
b2sums=('16f702f335e277513da2062bb3fe0a60b2cdceea1dd1aefcfd229a60fd7e55e2073127f1f512e9b8f59f661ffc17a7839faeeea74963e7caf9cae1235dafa98e'
        'c02d4502bd3bc88a4666f4ff947206509ac0d83ba089a10d67aa56ca44c3e92efb8dbe3ecbd5a1f83b16c3d7af5a47dc35a184325ff8b7250869c3ae8b7a7ee6')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p 1 < ../Cargo.toml.patch
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-$pkgver/target/release/$pkgname"
}
