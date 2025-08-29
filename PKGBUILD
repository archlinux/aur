# Maintainer: Rolv Apneseth <rolv.apneseth@gmail.com>

pkgname=clipvault
pkgver=1.0.0
pkgrel=1
pkgdesc="Clipboard history manager for Wayland, inspired by cliphist"
arch=('x86_64')
url="https://github.com/rolv-apneseth/clipvault"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fac175c2a0406bcd078853b4845b2d20a24bbb999522e4611d632c9811a73fef83610aa88268924823e27fcf840360f2a70930de34e64ef7436dc0cdfd1132cc')
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
