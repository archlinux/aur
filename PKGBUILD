# Maintainer: Martin Etchebarne <martin@etchebarne.net>
pkgname=kosmos
pkgver=0.4.0
pkgrel=1
pkgdesc="A modern code editor."
arch=('x86_64')
url="https://github.com/etchebarne/kosmos"
license=('MIT')
depends=(
    'fontconfig'
    'hicolor-icon-theme'
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'vulkan-icd-loader'
    'wayland'
)
makedepends=('cargo' 'pkgconf' 'rust' 'vulkan-headers')
provides=('kosmos')
conflicts=('kosmos-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/etchebarne/kosmos/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked -p kosmos
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/kosmos" "$pkgdir/usr/bin/kosmos"

    install -d "$pkgdir/usr/share/applications"
    APP_NAME="Kosmos" APP_CLI="kosmos" APP_ICON="kosmos" APP_ARGS="%U" \
        APP_ID="net.etchebarne.Kosmos" DO_STARTUP_NOTIFY="true" \
        envsubst < "packaging/linux/Kosmos.desktop.in" \
        > "$pkgdir/usr/share/applications/net.etchebarne.Kosmos.desktop"
    chmod 644 "$pkgdir/usr/share/applications/net.etchebarne.Kosmos.desktop"

    for size in 16 32 48 64 128 256 512; do
        install -Dm644 "assets/icon/icon-${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/kosmos.png"
    done
    install -Dm644 "assets/icon/icon.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/kosmos.svg"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
