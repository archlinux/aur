# Maintainer: eDEX-DE Contributors <https://github.com/eDEX-OS/eDEX-DE>
pkgname=edex-de
pkgver=1.1.3
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
    'nasm'
)
provides=('edex-de')
conflicts=('edex-de-git')

# Source: release CI uploads versioned source tarballs.
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eDEX-OS/eDEX-DE/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e7962a11e462549181529cbaa364ebe61250f2fc0997755f77b48e7e4aa1900f')

prepare() {
    cd "eDEX-DE-${pkgver}"
    npm install
}

build() {
    cd "eDEX-DE-${pkgver}"
    # ring crate requires nasm or bfd linker on Arch (lld incompatible without nasm)
    export CARGO_INCREMENTAL=0
    export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=bfd"
    npm run tauri -- build --no-bundle
}

package() {
    cd "eDEX-DE-${pkgver}"

    install -Dm755 "target/release/edex-de" "${pkgdir}/usr/bin/edex-de"
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
