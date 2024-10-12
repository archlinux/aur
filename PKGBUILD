# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname='hyprgui'
pkgver=0.1.0
pkgrel=1
pkgdesc='GUI for configuring Hyprland, written in blazingly fast Rust!'
arch=('x86_64')
url='https://github.com/nnyyxxxx/hyprgui'
license=('GPL-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nnyyxxxx/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba324fcc326135e010b272ff0cc302cdb600f07a772bb9f754a22cb102f5485c')
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
