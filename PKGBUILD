# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname='hyprgui'
pkgver=0.1.9
pkgrel=1
pkgdesc='GUI for configuring Hyprland, written in blazingly fast Rust!'
arch=('x86_64')
url='https://github.com/hyprutils/hyprgui'
license=('GPL-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hyprutils/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('73376dbc8b70d2ea325be515ff140f72bd194f49ba647be133e921b65b0b55dd')
makedepends=('rustup' 'pango' 'glibc' 'gcc-libs')
depends=('gtk4')
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
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/icons/$pkgname.png"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
