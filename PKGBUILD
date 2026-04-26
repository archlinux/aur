# Maintainer: Kneesox <https://kneesox.moe>

pkgname=cvr-melon-assistant-git
pkgver=r1.r42fbf4b
pkgrel=1
pkgdesc="Mod manager for ChilloutVR using MelonLoader — unofficial Linux port (git)"
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
    'git'
)
provides=('cvr-melon-assistant')
conflicts=('cvr-melon-assistant')
source=("${pkgname}::git+https://github.com/ShiroBlank/CVRMelonAssistantLinux.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    # Format: r<commit_count>.r<short_hash>
    # e.g. r42.rabcdef1 — increments automatically with every commit
    printf "r%s.r%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --offline
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --locked --offline
}

package() {
    cd "${pkgname}"

    install -Dm755 "target/release/cvr-melon-assistant" \
        "${pkgdir}/usr/bin/cvr-melon-assistant"

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

    install -Dm644 "assets/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.cvrmg.melon-assistant.png"
    install -Dm644 "assets/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.cvrmg.melon-assistant.svg"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
