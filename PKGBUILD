# Maintainer: Serene-Arc

pkgname=listenbrainz-playlist-uploader-git
pkgver=0.1.0.r1.g32408ff
pkgrel=1
pkgdesc="A tool for uploading playlists to ListenBrainz with feedback"
url="https://github.com/Serene-Arc/listenbrainz-playlist-uploader"
license=("MIT")
arch=("x86_64")
makedepends=(cargo)
source=("$pkgname::git+https://github.com/Serene-Arc/listenbrainz-playlist-uploader.git")
options=("debug" "!strip")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$pkgname"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$pkgname"
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/listenbrainz-playlist-uploader"
}
