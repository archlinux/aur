# Maintainer: eDEX-DE Contributors <https://github.com/eDEX-OS/eDEX-DE>
pkgname=edex-de
pkgver=1.1.1
pkgrel=1
pkgdesc="Sci-fi themed Wayland Desktop Environment for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/eDEX-OS/eDEX-DE"
license=('GPL-3.0')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'hyprland'
)
optdepends=(
    'pipewire-pulse: audio control'
    'networkmanager: network management'
    'fprintd: fingerprint authentication'
    'systemd: service management'
)
makedepends=(
    'rust'
    'cargo'
    'nodejs'
    'npm'
    'pkg-config'
    'openssl'
    'libsoup'
    'webkit2gtk-4.1'
)
provides=('edex-de')
conflicts=('edex-de-git')

# Source: release CI uploads versioned source tarballs.
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eDEX-OS/eDEX-DE/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('874c38b32b150332ba0882826cf4ad852417b955ba02a56f12442753a8d5b9f4')

prepare() {
    cd "eDEX-DE-${pkgver}"
    npm install
}

build() {
    cd "eDEX-DE-${pkgver}"
    npm run tauri -- build --no-bundle
}

package() {
    cd "eDEX-DE-${pkgver}"

    install -Dm755 "src-tauri/target/release/edex-de" "${pkgdir}/usr/bin/edex-de"
    install -Dm644 "packaging/edex-de.desktop" "${pkgdir}/usr/share/applications/edex-de.desktop"

    for size in 32x32 128x128; do
        install -Dm644 "src-tauri/icons/${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/edex-de.png"
    done

    if [[ -f LICENSE ]]; then
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi

    if [[ -f README.md ]]; then
        install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
}
