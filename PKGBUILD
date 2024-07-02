# Maintainer: Serene-Arc

pkgname=listenbrainz-playlist-uploader
pkgver=0.1.1
pkgrel=1
pkgdesc="A tool for uploading playlists to ListenBrainz with feedback"
url="https://github.com/Serene-Arc/listenbrainz-playlist-uploader"
license=("MIT")
arch=("x86_64")
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
options=("debug" "!strip")
sha256sums=("b3311b825f10247720c66404a103268d974f2c4fc232c1e2998e19ce4aa1b3c4")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
