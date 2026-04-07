# Maintainer: Arunachalam-gojosaturo <aur@luna-ai>
pkgname=luna-ai
pkgver=6.2.0
pkgrel=1
pkgdesc="L.U.N.A. AI v6 — hacker-style PyQt6 AI desktop assistant with voice, Gemini/Groq, TTS"
arch=('x86_64' 'aarch64')
url="https://github.com/Arunachalam-gojosaturo/Luna-ai"
license=('MIT')
depends=('python' 'python-pyqt6' 'portaudio' 'mpv' 'python-pip')
optdepends=('python-pyaudio: microphone / voice input support')
install=luna-ai.install

source=("luna-ai-${pkgver}.tar.gz::https://github.com/Arunachalam-gojosaturo/Luna-ai/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5d82130dcf979d383e8187ee9a02f8da42f0dc03dc7b3b4d3a1f7b105c2b390')

prepare() {
    mv -f "${srcdir}/Luna-ai-${pkgver}" "${srcdir}/luna-ai" 2>/dev/null || true
}

package() {
    cd "${srcdir}/luna-ai"

    install -dm755 "${pkgdir}/opt/luna-ai"
    install -dm755 "${pkgdir}/opt/luna-ai/core"
    install -dm755 "${pkgdir}/opt/luna-ai/ui"
    install -dm755 "${pkgdir}/opt/luna-ai/ui/styles"
    install -dm755 "${pkgdir}/opt/luna-ai/assets"

    install -Dm755 main.py          "${pkgdir}/opt/luna-ai/main.py"
    install -Dm644 requirements.txt "${pkgdir}/opt/luna-ai/requirements.txt"

    for f in core/*.py;       do install -Dm644 "$f" "${pkgdir}/opt/luna-ai/$f"; done
    for f in ui/*.py;         do install -Dm644 "$f" "${pkgdir}/opt/luna-ai/$f"; done
    install -Dm644 ui/styles/theme.qss "${pkgdir}/opt/luna-ai/ui/styles/theme.qss"
    for f in assets/*; do [ -f "$f" ] && install -Dm644 "$f" "${pkgdir}/opt/luna-ai/$f"; done

    # Global launcher
    install -dm755 "${pkgdir}/usr/local/bin"
    cat > "${pkgdir}/usr/local/bin/luna" << 'LAUNCHER'
#!/usr/bin/env bash
export DISPLAY="${DISPLAY:-:0}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}"
export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=/run/user/$(id -u)/bus}"
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-wayland}"
export TMPDIR=/tmp
exec /opt/luna-ai/venv/bin/python3 /opt/luna-ai/main.py "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/local/bin/luna"

    # Fish function
    install -dm755 "${pkgdir}/usr/share/fish/vendor_functions.d"
    printf 'function luna\n    /usr/local/bin/luna $argv\nend\n' \
        > "${pkgdir}/usr/share/fish/vendor_functions.d/luna.fish"

    # .desktop
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/luna-ai.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Luna AI
Comment=Hacker-style AI assistant with voice control
Exec=/usr/local/bin/luna
Icon=dialog-information
Terminal=false
Type=Application
Categories=Utility;
Keywords=AI;voice;assistant;luna;
DESKTOP

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "MIT License — Copyright 2026 Arunachalam-gojosaturo" \
        > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
