# Mantainer: Fabrizio Pietrucci <bamlessnty5@gmail.com>

pkgname=syngestures
pkgver=1.0
pkgrel=4
pkgdesc="Swipes and gestures for Linux with the MT multitouch protocol"
arch=('x86_64')
url="https://github.com/mqudsi/syngesture"
license=('MIT')
makedepends=('cargo')
depends=('evtest')
optdepends=("wmctrl: needed for syngestures-switch-ws for X11 and Wayland compatible workspace switching"
            "xdotool: simulates keyboard and mouse actions for Xorg or XWayland based apps")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mqudsi/syngesture/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('308499e6dceb40a11dc56d8c780d3844f92d846f6819af1012aabf1e9843fdee')
backup=("usr/local/etc/syngestures.toml")

prepare() {
    cd "syngesture-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/syngesture-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

package() {
    install -Dm644 ${srcdir}/syngesture-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 ${srcdir}/syngesture-${pkgver}/target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm755 ../syngestures-switch-ws ${pkgdir}/usr/bin/syngestures-switch-ws
    install -Dm644 ../syngestures.toml ${pkgdir}/usr/local/etc/syngestures.toml
    install -Dm644 ../syngestures.desktop ${pkgdir}/usr/share/applications/syngestures.desktop
}
