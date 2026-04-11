# Maintainer: Arunachalam-gojosaturo <cutyarunachalam1@gmail.com>

pkgname=luna-ai-reborn
pkgver=1.0.0
pkgrel=1
pkgdesc="Luna AI Reborn — Hacker-style voice AI desktop assistant for Linux. Voice, YouTube, brightness, live data."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/luna-ai-reborn"
license=('MIT')

depends=(
    'python>=3.10'
    'python-pyqt6'
    'mpv'
    'python-requests'
    'python-beautifulsoup4'
    'python-psutil'
)
optdepends=(
    'ffmpeg: ffplay audio fallback'
    'python-pygame: pygame audio fallback'
    'brightnessctl: brightness control'
    'yt-dlp: YouTube playback'
    'xdotool: X11 input control'
    'ydotool: Wayland input control'
    'python-speechrecognition: voice input'
    'python-pyaudio: microphone support'
)

makedepends=('python-pip')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Arunachalam-gojosaturo/luna-ai-reborn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('734ba2e1d62337b85d01cfab61cd86060928bffeb537d4c8543c3426c6933e64')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install app files
    install -dm755 "$pkgdir/opt/luna-ai-reborn"
    cp -r . "$pkgdir/opt/luna-ai-reborn/"

    # Optional Python deps (fallback, non-critical)
    TMPDIR=/tmp pip install --no-deps --quiet \
        --target="$pkgdir/opt/luna-ai-reborn/deps" \
        edge-tts google-genai groq 2>/dev/null || true

    # Launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/luna" << 'EOF'
#!/usr/bin/env bash
export DISPLAY="${DISPLAY:-:0}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}"
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-wayland}"
export MOZ_ENABLE_WAYLAND=1
export TMPDIR=/tmp
PYTHONPATH="/opt/luna-ai-reborn/deps:$PYTHONPATH"
exec python "/opt/luna-ai-reborn/main.py" "$@"
EOF
    chmod +x "$pkgdir/usr/bin/luna"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/luna-ai-reborn.desktop" << 'EOF'
[Desktop Entry]
Name=Luna AI Reborn
Comment=Hacker AI assistant with voice control
Exec=luna
Terminal=false
Type=Application
Categories=Utility;AI;
EOF

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/luna-ai-reborn/LICENSE" 2>/dev/null || true
}
