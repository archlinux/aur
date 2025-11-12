# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=omaro
pkgver=0.1.6
pkgrel=2
pkgdesc="TUI for lobste.rs. Browse posts and comments from the comfort of your terminal"
arch=('x86_64')
url="https://github.com/rolv-apneseth/omaro"
license=('AGPL-3.0-only')
depends=(
    gcc-libs # libgcc_s.so.1
    glibc    # libc.so.6, libm.so.6
    openssl  # libssl.so.3, libcrypto.so.3,
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d40c1de40e3d95f5951131f58054c670d0232e0631be264de1b631b674c937950ca609d6d910bddd3667a9af26894535f57893cb3aedc39be904e56ce70f3bc4')
options=(!debug !lto)

prepare()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check()
{
    cd "$pkgname-$pkgver" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package()
{
    cd "$pkgname-$pkgver" || exit
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
