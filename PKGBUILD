# Maintainer: Arunachalam-gojosaturo <cutyarunachalam1@gmail.com>
pkgname=luna-ai-reborn
pkgver=1.0.1
pkgrel=1
pkgdesc="Luna AI Reborn — Hacker-style voice AI desktop assistant for Linux. Voice, YouTube, brightness, live data."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/luna-ai-reborn"
license=('MIT')

depends=(
    'python>=3.10'
    'python-pyqt6'
    'mpv'
)
optdepends=(
    'ffmpeg: ffplay audio fallback'
    'brightnessctl: brightness control'
    'yt-dlp: YouTube playback'
    'xdotool: X11 input control'
    'ydotool: Wayland input control'
    'python-speechrecognition: voice input'
    'python-pyaudio: microphone support'
)
makedepends=('python-pip' 'python-build' 'python-installer')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Arunachalam-gojosaturo/luna-ai-reborn/archive/v$pkgver.tar.gz")
sha256sums=('YOUR_HASH')

package() {
    local SRCDIR
    SRCDIR=$(find "$srcdir" -maxdepth 1 -mindepth 1 -type d | head -1)

    # Install app files
    install -dm755 "$pkgdir/opt/luna-ai-reborn"
    cp -r "$SRCDIR"/. "$pkgdir/opt/luna-ai-reborn/"

    # Install ALL Python deps properly
    install -dm755 "$pkgdir/opt/luna-ai-reborn/deps"
    TMPDIR=/tmp pip install \
        --target="$pkgdir/opt/luna-ai-reborn/deps" \
        --no-deps \
        --upgrade \
        --quiet \
        edge-tts \
        groq \
        google-genai \
        requests \
        psutil \
        pygame \
        beautifulsoup4 \
        yt-dlp \
        aiohttp \
        certifi \
        tabulate \
        typing-extensions \
        httpx \
        anyio \
        sniffio \
        2>/dev/null || true

    # Install with deps this time for anything that failed
    TMPDIR=/tmp pip install \
        --target="$pkgdir/opt/luna-ai-reborn/deps" \
        --upgrade \
        --quiet \
        groq \
        google-genai \
        edge-tts \
        2>/dev/null || true

    # Global launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/luna" << 'LAUNCHEOF'
#!/usr/bin/env bash
export DISPLAY="${DISPLAY:-:0}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}"
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-wayland}"
export MOZ_ENABLE_WAYLAND=1
export TMPDIR=/tmp
export PYTHONPATH="/opt/luna-ai-reborn/deps:${PYTHONPATH:-}"
exec python /opt/luna-ai-reborn/main.py "$@"
LAUNCHEOF
    chmod +x "$pkgdir/usr/bin/luna"

    # .desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/luna-ai-reborn.desktop" << 'DESKTOPEOF'
[Desktop Entry]
Name=Luna AI Reborn
Comment=Hacker AI assistant with voice control
Exec=luna
Terminal=false
Type=Application
Categories=Utility;AI;
DESKTOPEOF

    install -Dm644 "$SRCDIR/LICENSE" \
        "$pkgdir/usr/share/licenses/luna-ai-reborn/LICENSE" 2>/dev/null || true
}
