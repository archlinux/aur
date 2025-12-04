# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=alistral
_reponame=Alistral
pkgver=0.6.2
pkgrel=1
pkgdesc="Power tools for Listenbrainz"
arch=('x86_64')
url="https://github.com/RustyNova016/$_reponame"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'bzip2' 'xz')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RustyNova016/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ee0f9c978d425ce79c88b733b5e781bf3c3801c5485263b49a51bebfa4a11c31b6dce2d49f056fcc3aea746261ecea37d67bd2cd305126d4e165957eaa9bba28')

prepare() {
    cd "$_reponame-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_reponame-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export SQLX_OFFLINE=true
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
