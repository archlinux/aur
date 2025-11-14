# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rgd
pkgver=1.2.1
pkgrel=1
pkgdesc="Installed game detection utility for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/rolv-apneseth/rgd"
license=('AGPL3')
depends=(
    gcc-libs # libgcc_s.so.1
    glibc    # libc.so.6 libm.so.6
    sqlite   # libsqlite3.so.0
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a6009d7d949c3b675caa4445e115372c411cdb3a5d9daa8c68f917dff4e844503337e25bdbd0660e68afdbd185b7f6c2a3e21f91ad33e7861f2cacd239760e3b')
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

package()
{
    cd "$pkgname-$pkgver" || exit
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
