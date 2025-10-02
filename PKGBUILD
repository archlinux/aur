# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=rgd
pkgver=1.0.0
pkgrel=1
pkgdesc="Installed game detection utility for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/rolv-apneseth/rgd"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('56ca0df2a113ee3a0bb5f2885b84f5a00f5ec942df72663bc9a3ba416bb0e5dd057eb6117a0dbeaa1a2b0562182a91f4f5a3da2e685a9df85fb1ba0e53855c03')
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
