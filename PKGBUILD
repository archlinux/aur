# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
pkgname=livesplit-one-druid
pkgver=0.7.2
pkgrel=1
pkgdesc="A native LiveSplit One frontend built with druid"
arch=('x86_64')
url="https://github.com/AlexKnauth/livesplit-one-druid"
license=('LicenseRef-unknown')
depends=('gtk3')
makedepends=('rust' 'git' 'imagemagick')
conflicts=('livesplit-one-druid-bin')
# mimalloc-sys builds a static C lib; makepkg's -flto=auto turns it into GIMPLE
# bytecode that the (non-LTO) Rust link step can't resolve -> undefined mi_* symbols.
options=('!lto')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlexKnauth/livesplit-one-druid/archive/refs/tags/$pkgver.tar.gz"
    "Icon.ico::https://raw.githubusercontent.com/AlexKnauth/livesplit-one-druid/master/Icon.ico"
    "$pkgname.desktop")
sha256sums=('6e3b6a56d064893a8938a092c32acfcb89e6483d8dcb39d4e91f2114d38dd9b2'
    '4e4b8302ed9ba8380d519078d23ebafd7a983ccb6bb0d4c3703ff546baec19f8'
    'SKIP')

prepare() {
    magick "$srcdir/Icon.ico" "$srcdir/$pkgname.png"
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/"
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/livesplit-one" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
