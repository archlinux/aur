# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname='hyprgui'
pkgver=0.1.2
pkgrel=1
pkgdesc='GUI for configuring Hyprland, written in blazingly fast Rust!'
arch=('x86_64')
url='https://github.com/nnyyxxxx/hyprgui'
license=('GPL-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nnyyxxxx/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9e7dd26aae45d0cce5adb30e554f352e4a8766301ca74e846785539ef07c945')
makedepends=('rustup' 'pango')
depends=('glibc' 'gcc-libs' 'gtk4')
optdepends=('hyprland')

prepare() {
    cd "$pkgname-$pkgver"
    echo "Version=$pkgver" >> "$pkgname.desktop"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"

    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
