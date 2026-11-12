# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=m-flasher
pkgver=0.11.0
pkgrel=1
pkgdesc="Back up, restore and reinstall the firmware of an M-VAVE FM-1 or SMK-37"
arch=('x86_64' 'armv7h')
url="https://github.com/jvitkauskas/m-flasher"
license=('MIT')
depends=('glibc' 'libgcc' 'systemd-libs')
makedepends=('cargo')
source=("https://github.com/jvitkauskas/m-flasher/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b6759ee644e00fe5951eee49a2ee1a56f138016fa797b133371670614c960cb3')
b2sums=('0ef8fdbd5ca1b7092a83b6f59f4a6f62006e6729e17b40afe853fa4e7e6478cc7768c7798842bc9c6e33252a3c4780a0e1c656549a4a230580a4bb2945ec738b')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm0644 -t "$pkgdir/usr/lib/udev/rules.d/" "linux/70-m-flasher.rules"

    # Desktop file and icon
    install -Dm0644 "linux/m-flasher.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
    install -Dm0644 "linux/package/io.github.jvitkauskas.m-flasher.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
