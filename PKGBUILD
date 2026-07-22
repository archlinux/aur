# Maintainer: Ashley Piller <ashley@purrr.chat>
# Builds the latest dev version of the purrr desktop client from git HEAD.
pkgname=purrr-client-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Native desktop client for purrr, a cozy self-hosted Discord alternative (latest dev, built from source)"
arch=('x86_64')
url="https://purrr.chat"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=('rust' 'cargo' 'git')
provides=('purrr-client')
conflicts=('purrr-client' 'purrr-client-bin')
source=("${pkgname}::git+https://git.purrr.chat/ashley/purrr-client.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # e.g. 0.1.0.r42.gabc1234
    printf '%s.r%s.g%s' \
        "$(awk -F'"' '/^version/{print $2; exit}' src-tauri/Cargo.toml)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    # Pure cargo build — the UI is served from the instance, dist/ is only a stub.
    export CARGO_TARGET_DIR="${srcdir}/target"
    cargo build --release --manifest-path src-tauri/Cargo.toml
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "${srcdir}/target/release/purrr-desktop" "${pkgdir}/usr/bin/purrr"
    install -Dm644 src-tauri/icons/128x128.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/purrr.png"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/purrr.desktop" <<'EOF'
[Desktop Entry]
Name=purrr (dev)
Comment=A cozy, self-hosted Discord alternative
Exec=purrr
Icon=purrr
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
EOF
}
