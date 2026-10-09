# Maintainer: yakuda <yakuda@outlook.de>
pkgname=linuxvr-viewshot
pkgver=1.0.4
pkgrel=1
pkgdesc="Take photos in VR with a hand-frame gesture on Linux (WiVRn / Monado) - OpenXR API layer + desktop app"
# Der OpenXR-Layer ist eine native .so (Rust) -> nicht 'any'
arch=('x86_64')
url="https://github.com/yakuda-stack/LinuxVR-ViewShot"
license=('GPL-3.0-or-later')
# Laufzeit: der Layer braucht libvulkan (dlopen), die App PyQt6.
# xcb-util-cursor & Co: Qt >= 6.5 braucht sie fuer das xcb-Plugin (X11/XWayland).
# python-setproctitle: Name "LinuxVR-ViewShot" im Taskmanager (ginge auch ohne).
depends=('glibc' 'gcc-libs' 'vulkan-icd-loader'
         'python' 'python-pyqt6' 'python-setproctitle'
         'xcb-util-cursor' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms'
         'xcb-util-renderutil' 'libxkbcommon-x11')
makedepends=('cargo')
# Kein LTO von makepkg: sonst baut gcc die C-Teile von „ring“ (TLS für ureq) als
# GCC-LTO-Code, und Rusts Linker (rust-lld, Standard seit Rust 1.90) kann den nicht
# lesen → „undefined symbol: ring_core_…“. Rust macht sein eigenes LTO (Cargo.toml).
options=('!lto')
optdepends=('python-opencv: QR code detection in photos'
            'python-onnxruntime-cpu: text recognition for the translation (plus "pip install --user rapidocr")'
            'glib2: move deleted photos to the trash via gio (fallback)'
            'wl-clipboard: copy from the VR panel when only the background service runs')
# Git-Tag darf einen Bindestrich haben (v0.5.0-alpha), pkgver nicht
_tag="v${pkgver/_/-}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
# Hinweis nach Installation/Update: einmal "Installieren" in der App drücken
install="${pkgname}.install"
sha256sums=('3ab6442798a5baee2e2970242c74fac9efcde91b41309dbb2ca816ce87f06fdd')

_srcdir() { echo "LinuxVR-ViewShot-${_tag#v}"; }

prepare() {
    cd "$(_srcdir)"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$(_srcdir)"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$(_srcdir)"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$(_srcdir)"

    # OpenXR-Layer: nur die fertige .so + Manifest-VORLAGE – KEIN systemweites
    # Manifest in /usr/share/openxr! Steam-/Proton-Spiele (VRChat) laufen im
    # Steam-Container und sehen /usr des Systems nicht. Die App kopiert den
    # Layer beim Klick auf "Installieren" nach ~/.local (sieht jedes Spiel) und
    # nach Paket-Updates automatisch (UI/core/layer_install.py).
    install -Dm755 target/release/liblinuxvr_viewshot_layer.so \
        "${pkgdir}/usr/lib/${pkgname}/liblinuxvr_viewshot_layer.so"
    # ⚙ Hintergrund-Dienst (uebersetzt ohne offene App) – die App kopiert ihn nach ~/.local
    install -Dm755 target/release/viewshot-daemon \
        "${pkgdir}/usr/lib/${pkgname}/viewshot-daemon"
    install -Dm644 manifest/linuxvr_viewshot.json.in \
        "${pkgdir}/usr/share/${pkgname}/manifest/linuxvr_viewshot.json.in"

    # App nach /usr/share/linuxvr-viewshot/UI (Struktur bleibt, core/paths.py
    # findet Icon & Co. relativ zu sich selbst). Ohne scripts/ erkennt die App,
    # dass sie aus einem Paket kommt (Layer kopieren statt bauen).
    local app="${pkgdir}/usr/share/${pkgname}/UI"
    install -Dm644 UI/main.py "${app}/main.py"
    install -Dm644 UI/starter.py "${app}/starter.py"
    install -Dm755 UI/start.sh "${app}/start.sh"
    cp -r UI/core UI/ui UI/assets "${app}/"
    find "${app}" -name '__pycache__' -type d -exec rm -rf {} + 2>/dev/null || true

    # Launcher (voller Pfad zu starter.py = Platz fuer den Prozessnamen)
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCH'
#!/usr/bin/env bash
exec python3 /usr/share/linuxvr-viewshot/UI/starter.py "$@"
LAUNCH
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Desktop-Eintrag + Icon
    sed "s|@START@|${pkgname}|" packaging/${pkgname}.desktop.in > "${srcdir}/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 UI/assets/${pkgname}.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    # Lizenz + Doku
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
