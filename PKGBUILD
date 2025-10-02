# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=basalt
pkgver=0.10.3
pkgrel=1
pkgdesc='A TUI Application to manage Obsidian notes'
url='https://github.com/erikjuhani/basalt'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/basalt/v$pkgver.tar.gz")
sha256sums=('28854b21781b2a86391c253f62858a0b48cddcf6e2e5e007730953937e1b913e')
_srcdir="$pkgname-$pkgname-v$pkgver"

prepare() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_srcdir"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --workspace --frozen --all-features
}

package() {
    cd "$_srcdir"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
