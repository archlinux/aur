# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=termframe
pkgver=0.7.2
pkgrel=1
pkgdesc='Convert terminal output into an SVG file'
url='https://github.com/pamburus/termframe'
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('cargo' 'clang')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fc0d701caa7128bdaaceff49ce73bf94b79340ca58827cdd8adff2911ac90224')

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
