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
    'python-pip'
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

source=("$pkgname-$pkgver.tar.gz::https://github.com/Arunachalam-gojosaturo/luna-ai-reborn/archive/v$pkgver.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    local SRCDIR
    SRCDIR=$(find "$srcdir" -maxdepth 1 -mindepth 1 -type d | head -1)

    install -dm755 "$pkgdir/opt/luna-ai-reborn"
    cp -r "$SRCDIR"/. "$pkgdir/opt/luna-ai-reborn/"

    # Python deps inside package
    TMPDIR=/tmp pip install --no-deps --quiet         --target="$pkgdir/opt/luna-ai-reborn/deps"         edge-tts google-genai groq requests         beautifulsoup4 psutil pygame 2>/dev/null || true

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/luna" << 'LAUNCHEOF'
#!/usr/bin/env bash
export DISPLAY="${DISPLAY:-:0}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}"
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-wayland}"
export MOZ_ENABLE_WAYLAND=1
export TMPDIR=/tmp
PYTHONPATH="/opt/luna-ai-reborn/deps:$PYTHONPATH"
exec python "/opt/luna-ai-reborn/main.py" "$@"
LAUNCHEOF
    chmod +x "$pkgdir/usr/bin/luna"

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

    install -Dm644 "$SRCDIR/LICENSE" "$pkgdir/usr/share/licenses/luna-ai-reborn/LICENSE" 2>/dev/null || true
}
