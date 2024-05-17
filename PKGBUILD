# Maintainer: Mahor Foruzesh <mahor1221@gmail.com>

pkgname=cargo-limit
_pkgname="$pkgname"
pkgver=0.0.10
_pkgsrc="$_pkgname-$pkgver"
pkgrel=1
pkgdesc="Cargo with less noise"
arch=(x86_64)
url="https://github.com/cargo-limit/cargo-limit"
license=(MIT Apache-2.0)
depends=(cargo gcc-libs glibc)
makedepends=(rust)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('85fe2b48178494123fddbfcc94c0a796629eb21ebca579de6a2408fc6d2a553c')

prepare() {
    cd "$_pkgsrc"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgsrc"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgsrc"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgsrc"
    install -vDm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -vDm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$_pkgname/"
    install -vDm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
