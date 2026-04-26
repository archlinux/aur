# Maintainer: Kneesox <https://kneesox.moe>
# Contributor: Kneesox

pkgname=cvr-melon-assistant
pkgver=1.2.1
pkgrel=1
pkgdesc="Mod manager for ChilloutVR using MelonLoader — unofficial Linux port"
arch=('x86_64')
url="https://github.com/ShiroBlank/CVRMelonAssistantLinux"
license=('CC-BY-NC-4.0')
depends=(
    'gtk4'
    'openssl'
    'hicolor-icon-theme'
)
makedepends=(
    'rust'
    'cargo'
    'pkgconf'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ShiroBlank/CVRMelonAssistantLinux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb14743c009b3bd73ff9e563921abd273d8a7916f8c6b68f0881dc692c9bd581')

# If you want to build from the latest commit instead of a tag, use:
# source=("${pkgname}::git+https://github.com/ShiroBlank/CVRMelonAssistantLinux.git")
# sha256sums=('SKIP')

prepare() {
    cd "CVRMelonAssistantLinux-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "CVRMelonAssistantLinux-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --offline
}

check() {
    cd "CVRMelonAssistantLinux-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --locked --offline
}

package() {
    cd "CVRMelonAssistantLinux-${pkgver}"

    # Binary
    install -Dm755 "target/release/cvr-melon-assistant" \
        "${pkgdir}/usr/bin/cvr-melon-assistant"

    # Desktop entry
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/com.cvrmg.melon-assistant.desktop" << DESKTOP
[Desktop Entry]
Type=Application
Name=CVR MelonLoader Assistant
Exec=cvr-melon-assistant
Icon=com.cvrmg.melon-assistant
Comment=Mod manager for ChilloutVR using MelonLoader (Linux/Proton)
Categories=Game;Utility;
StartupWMClass=com.cvrmg.melon-assistant
StartupNotify=true
DESKTOP

    # Icons
    install -Dm644 "assets/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.cvrmg.melon-assistant.png"
    install -Dm644 "assets/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.cvrmg.melon-assistant.svg"

    # License
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
