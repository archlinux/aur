# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=termframe
pkgver=0.6.5
pkgrel=1
pkgdesc='Convert terminal output into an SVG file'
url='https://github.com/pamburus/termframe'
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('cargo' 'clang')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('db6f96c372f68eb59540a90023830063c2611188147ec6ac5e0b9414ac1d311b')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CC=clang
    export CXX=clang++
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --workspace --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
