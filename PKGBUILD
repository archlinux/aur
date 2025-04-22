# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=alistral
_reponame=Alistral
pkgver=0.5.7
pkgrel=1
pkgdesc="Power tools for Listenbrainz"
arch=('x86_64')
url="https://github.com/RustyNova016/$_reponame"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'bzip2' 'xz')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RustyNova016/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c6dd170f28cb8fa3599cb9e9e06387363306a6e231ca7b6e2630cb8f998fd081d837a8c4efc8863dcd68d6e73486d0248b51cf5c52ce24190bfdb4179949845d')

prepare() {
    cd "$_reponame-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_reponame-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --no-default-features
}

check() {
    cd "$_reponame-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_reponame-$pkgver"

    install -Dm755 "target/release/$pkgname" -T "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
