# Maintainer: yakuda <yakuda@outlook.de>
pkgname=linuxvr-viewshot
pkgver=0.4.1
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
optdepends=('python-opencv: QR code detection in photos'
            'python-onnxruntime-cpu: text recognition for the translation (plus "pip install --user rapidocr")'
            'wayvr: open the app from the WayVR watch (Options -> General)'
            'glib2: move deleted photos to the trash via gio (fallback)')
# Git-Tag darf einen Bindestrich haben (v0.5.0-alpha), pkgver nicht
_tag="v${pkgver/_/-}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('150b079f165ff61cc8611beede785169115ce0a418eba3abebeca4d242e70145')

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

    # OpenXR-Layer + systemweites Manifest (gilt fuer alle Benutzer)
    local lib="/usr/lib/${pkgname}/liblinuxvr_viewshot_layer.so"
    install -Dm755 target/release/liblinuxvr_viewshot_layer.so "${pkgdir}${lib}"
    install -dm755 "${pkgdir}/usr/share/openxr/1/api_layers/implicit.d"
    sed "s|@LIBRARY_PATH@|${lib}|" manifest/linuxvr_viewshot.json.in \
        > "${pkgdir}/usr/share/openxr/1/api_layers/implicit.d/linuxvr_viewshot.json"

    # App nach /usr/share/linuxvr-viewshot/UI (Struktur bleibt, core/paths.py
    # findet Icon & Co. relativ zu sich selbst). Ohne scripts/ erkennt die App,
    # dass sie aus einem Paket kommt, und blendet "Neu bauen/Entfernen" aus.
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
