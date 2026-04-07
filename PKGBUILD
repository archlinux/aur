# Maintainer: Arunachalam-gojosaturo <your-email@example.com>
pkgname=luna-ai
pkgver=6.2.0
pkgrel=1
pkgdesc="L.U.N.A. AI v6 — Language Understanding Neural Agent: hacker-style PyQt6 AI desktop assistant with voice, Gemini/Groq, TTS, and more"
arch=('x86_64' 'aarch64')
url="https://github.com/Arunachalam-gojosaturo/Luna-ai"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'portaudio'
    'mpv'
)
optdepends=(
    'python-pyaudio: microphone / voice input support'
)
makedepends=('python-pip' 'python-virtualenv')
provides=('luna-ai')
conflicts=('luna-ai')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Arunachalam-gojosaturo/Luna-ai/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5d82130dcf979d383e8187ee9a02f8da42f0dc03dc7b3b4d3a1f7b105c2b390')

prepare() {
    # Rename extracted dir to a predictable name
    mv -f "${srcdir}/Luna-ai-${pkgver}" "${srcdir}/luna-ai" 2>/dev/null || true
}

package() {
    cd "${srcdir}/luna-ai"

    # ── Install app to /opt/luna-ai ──────────────────────────────
    install -dm755 "${pkgdir}/opt/luna-ai"
    install -dm755 "${pkgdir}/opt/luna-ai/core"
    install -dm755 "${pkgdir}/opt/luna-ai/ui"
    install -dm755 "${pkgdir}/opt/luna-ai/ui/styles"
    install -dm755 "${pkgdir}/opt/luna-ai/assets"

    install -Dm755 main.py            "${pkgdir}/opt/luna-ai/main.py"
    install -Dm644 requirements.txt   "${pkgdir}/opt/luna-ai/requirements.txt"

    # core/
    for f in core/*.py; do
        install -Dm644 "$f" "${pkgdir}/opt/luna-ai/$f"
    done

    # ui/
    for f in ui/*.py; do
        install -Dm644 "$f" "${pkgdir}/opt/luna-ai/$f"
    done
    install -Dm644 ui/styles/theme.qss "${pkgdir}/opt/luna-ai/ui/styles/theme.qss"

    # assets/
    for f in assets/*; do
        [ -f "$f" ] && install -Dm644 "$f" "${pkgdir}/opt/luna-ai/$f"
    done

    # ── venv + pip packages ──────────────────────────────────────
    python3 -m venv "${pkgdir}/opt/luna-ai/venv"
    TMPDIR=/tmp "${pkgdir}/opt/luna-ai/venv/bin/pip" install --quiet --upgrade pip
    TMPDIR=/tmp "${pkgdir}/opt/luna-ai/venv/bin/pip" install --quiet \
        PyQt6 \
        edge-tts \
        google-genai \
        groq \
        requests \
        psutil \
        yt-dlp \
        SpeechRecognition \
        beautifulsoup4 \
        pygame

    # Optional – don't fail if pyaudio needs portaudio headers at build time
    TMPDIR=/tmp "${pkgdir}/opt/luna-ai/venv/bin/pip" install --quiet pyaudio 2>/dev/null || true

    # Fix venv paths (they'll point to pkgdir at build time, fix to final /opt)
    # Use sed to make the venv relocatable
    local venv_python="${pkgdir}/opt/luna-ai/venv/bin/python3"
    sed -i "s|${pkgdir}||g" "${pkgdir}/opt/luna-ai/venv/bin/activate" 2>/dev/null || true
    find "${pkgdir}/opt/luna-ai/venv/bin" -type f -exec \
        sed -i "s|#!.*pkgdir.*/opt/luna-ai/venv/bin/python|#!/opt/luna-ai/venv/bin/python|g" {} + 2>/dev/null || true

    # ── Global launcher /usr/local/bin/luna ──────────────────────
    install -dm755 "${pkgdir}/usr/local/bin"
    cat > "${pkgdir}/usr/local/bin/luna" << 'LAUNCHER'
#!/usr/bin/env bash
export DISPLAY="${DISPLAY:-:0}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}"
export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=/run/user/$(id -u)/bus}"
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-wayland}"
export MOZ_ENABLE_WAYLAND=1
export TMPDIR=/tmp
exec /opt/luna-ai/venv/bin/python3 /opt/luna-ai/main.py "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/local/bin/luna"

    # ── Fish shell function ───────────────────────────────────────
    install -dm755 "${pkgdir}/usr/share/fish/vendor_functions.d"
    cat > "${pkgdir}/usr/share/fish/vendor_functions.d/luna.fish" << 'FISH'
function luna
    /usr/local/bin/luna $argv
end
FISH

    # ── .desktop entry ───────────────────────────────────────────
    local icon
    icon=$(find "${pkgdir}/opt/luna-ai/assets" -name "*.png" 2>/dev/null | head -1 || echo "dialog-information")
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/luna-ai.desktop" << DESKTOP
[Desktop Entry]
Name=Luna AI
Comment=Hacker-style AI assistant with voice control
Exec=/usr/local/bin/luna
Icon=${icon}
Terminal=false
Type=Application
Categories=Utility;
Keywords=AI;voice;assistant;luna;
DESKTOP

    # ── License ──────────────────────────────────────────────────
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
MIT License — Copyright (c) 2026 Arunachalam-gojosaturo
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software to use, copy, modify, merge, publish and distribute it,
subject to the following conditions: The above copyright notice and this
permission notice shall be included in all copies or substantial portions.
LICENSE
}
