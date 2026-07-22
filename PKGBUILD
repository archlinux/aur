# Maintainer: Ashley Piller <ashley@purrr.chat>
# Builds the stable purrr desktop client from source (tagged release).
pkgname=purrr-client
pkgver=0.1.0
pkgrel=1
pkgdesc="Native desktop client for purrr, a cozy self-hosted Discord alternative (built from source)"
arch=('x86_64')
url="https://purrr.chat"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=('rust' 'cargo' 'git')
provides=('purrr-client')
conflicts=('purrr-client-bin' 'purrr-client-git')
source=("${pkgname}-${pkgver}::git+https://git.purrr.chat/ashley/purrr-client.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # The UI is served from the instance at runtime; dist/ is only a stub, so no
    # web build is needed here — just the Tauri shell (pure cargo build).
    export CARGO_TARGET_DIR="${srcdir}/target"
    cargo build --release --manifest-path src-tauri/Cargo.toml
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${srcdir}/target/release/purrr-desktop" "${pkgdir}/usr/bin/purrr"
    install -Dm644 src-tauri/icons/128x128.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/purrr.png"
    # Minimal desktop entry (Tauri's own .desktop only lands in the bundle build).
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/purrr.desktop" <<'EOF'
[Desktop Entry]
Name=purrr
Comment=A cozy, self-hosted Discord alternative
Exec=purrr
Icon=purrr
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
EOF
}
