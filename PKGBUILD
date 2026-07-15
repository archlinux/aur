# Maintainer: pyxyll <pyxyllv@gmail.com>
pkgname=cosmic-ext-control-center
pkgver=0.1.5
pkgrel=1
pkgdesc="A modular, pluggable control center for the COSMIC desktop (editor + panel applet)"
arch=('x86_64')
url="https://github.com/Pyxyll/cosmic-ext-control-center"
license=('MIT')
depends=(
    'libxkbcommon'
    'wayland'
)
optdepends=(
    'networkmanager: Wi-Fi and VPN tiles'
    'bluez-utils: Bluetooth tile'
    'util-linux: Airplane mode (rfkill)'
    'wireplumber: Volume and Microphone tiles'
    'power-profiles-daemon: Power profile tile'
)
makedepends=(
    'rust'
    'cargo'
    'git'
)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "$pkgname"
    install -Dm0755 target/release/cosmic-ext-control-center \
        "$pkgdir/usr/bin/cosmic-ext-control-center"
    install -Dm0755 target/release/cosmic-ext-control-center-applet \
        "$pkgdir/usr/bin/cosmic-ext-control-center-applet"

    install -Dm0644 resources/com.pyxyll.CosmicExtControlCenter.desktop \
        "$pkgdir/usr/share/applications/com.pyxyll.CosmicExtControlCenter.desktop"
    install -Dm0644 resources/com.pyxyll.CosmicExtControlCenterApplet.desktop \
        "$pkgdir/usr/share/applications/com.pyxyll.CosmicExtControlCenterApplet.desktop"
    install -Dm0644 resources/com.pyxyll.CosmicExtControlCenter.metainfo.xml \
        "$pkgdir/usr/share/metainfo/com.pyxyll.CosmicExtControlCenter.metainfo.xml"

    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
