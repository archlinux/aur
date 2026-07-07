# Maintainer: BitYoungjae <bityoungjae@github.com>
pkgname=mpvpaper-rs
pkgver=0.1.2
pkgrel=1
pkgdesc="Video wallpaper player using mpv for wlroots-based Wayland compositors"
arch=('x86_64' 'aarch64')
url="https://github.com/bityoungjae/mpvpaper-rs"
license=('GPL-3.0-only')
depends=('mpv' 'wayland' 'mesa' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pkg-config')
provides=('mpvpaper-rs' 'mpvpaper-rs-holder')
conflicts=('mpvpaper')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29cfd5b0ff4d6a3bb19d9483b3ac41b7705c1a925f3d9bd0f31e275d1c484ae3')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # check()에서는 --release 사용하지 않음 (overflow 체크 및 debug assertions 유지)
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/mpvpaper-rs"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/mpvpaper-rs-holder"
    install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
