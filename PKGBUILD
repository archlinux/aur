# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=m-flasher
pkgver=0.6.1
pkgrel=1
pkgdesc="Back up, restore and reinstall the firmware of an M-VAVE FM-1 or SMK-37"
arch=('x86_64' 'armv7h')
url="https://github.com/jvitkauskas/m-flasher"
license=('MIT')
depends=('glibc' 'libgcc' 'systemd-libs')
makedepends=('cargo')
source=("https://github.com/jvitkauskas/m-flasher/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e258ea9cb0dce1a5b323d46217c0ae791b13b24f172412d4d06d616b0a86b06')

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
