<<<<<<< HEAD
# Maintainer: Arunachalam-gojosaturo <cutyarunachalam1@gmail.com>
pkgname=luna-ai
pkgver=6.0.0
pkgrel=1
pkgdesc="Luna AI v6 — Hacker-style voice AI desktop assistant. Voice, YouTube, brightness, crypto, live data."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/luna-ai"
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
    'brightnessctl: screen brightness control'
    'yt-dlp: YouTube music playback'
    'xdotool: X11 keyboard/mouse control'
    'ydotool: Wayland keyboard/mouse control'
    'python-speechrecognition: voice input'
    'python-pyaudio: microphone support'
)
makedepends=('python-pip')

source=("luna-ai-$pkgver.tar.gz::https://github.com/Arunachalam-gojosaturo/luna-ai/archive/v$pkgver.tar.gz")
sha256sums=('fcb6f1c39ea1c84d119aaa0c8fad4e54faa0b64af3fa157bc6f6f8266612d8c1')

package() {
    local SRCDIR
    SRCDIR=$(find "$srcdir" -maxdepth 1 -mindepth 1 -type d | head -1)

    install -dm755 "$pkgdir/opt/luna-ai"
    cp -r "$SRCDIR"/. "$pkgdir/opt/luna-ai/"

    # Install Python deps into app directory
    TMPDIR=/tmp pip install --no-deps --quiet         --target="$pkgdir/opt/luna-ai/deps"         edge-tts google-genai groq requests         beautifulsoup4 psutil pygame 2>/dev/null || true

    # Global launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/luna-ai" << 'LAUNCHEOF'
#!/usr/bin/env bash
export DISPLAY="${DISPLAY:-:0}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}"
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-wayland}"
export MOZ_ENABLE_WAYLAND=1
export TMPDIR=/tmp
PYTHONPATH="/opt/luna-ai/deps:$PYTHONPATH" exec python /opt/luna-ai/main.py "$@"
LAUNCHEOF
    chmod +x "$pkgdir/usr/bin/luna-ai"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/luna-ai.desktop" << 'DESKTOPEOF'
[Desktop Entry]
Name=Luna AI
Comment=Hacker AI assistant with voice control
Exec=luna-ai
Terminal=false
Type=Application
Categories=Utility;AI;
DESKTOPEOF

    install -Dm644 "$SRCDIR/LICENSE" "$pkgdir/usr/share/licenses/luna-ai/LICENSE" 2>/dev/null || true
=======
# Maintainer: Arunachalam-gojosaturo <Arunachalam-gojosaturo@users.noreply.github.com>
pkgname=luna-ai
pkgver=1.0.0
pkgrel=1
pkgdesc="Hacker-style voice AI assistant for Arch Linux + Hyprland (YouTube, brightness, volume, crypto prices)"
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/Luna-ai"
license=('MIT')
depends=('python' 'python-pyqt6' 'firefox' 'brightnessctl' 'pipewire'
         'pipewire-pulse' 'wireplumber' 'yt-dlp' 'xdotool'
         'python-requests' 'python-psutil')
optdepends=('ydotool: Wayland input control'
            'python-speechrecognition: Voice input'
            'python-pyaudio: Microphone support')
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Arunachalam-gojosaturo/Luna-ai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    SRCDIR="$srcdir/Luna-ai-$pkgver"
    [ -d "$SRCDIR" ] || SRCDIR="$srcdir"
    install -dm755 "$pkgdir/opt/luna-ai"
    cp -r "$SRCDIR"/. "$pkgdir/opt/luna-ai/"
    rm -rf "$pkgdir/opt/luna-ai/.git" "$pkgdir/opt/luna-ai/venv" 2>/dev/null || true
    install -dm755 "$pkgdir/opt/luna-ai/vendor"
    pip install --no-deps --target="$pkgdir/opt/luna-ai/vendor" edge-tts google-genai groq 2>/dev/null || true
    install -dm755 "$pkgdir/usr/bin"
    printf '#!/usr/bin/env bash\nexport WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}"\nexport XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"\nexport PYTHONPATH="/opt/luna-ai/vendor:$PYTHONPATH"\nexport MOZ_ENABLE_WAYLAND=1\ncd /opt/luna-ai\nexec python /opt/luna-ai/main.py\n' > "$pkgdir/usr/bin/luna-ai"
    chmod 755 "$pkgdir/usr/bin/luna-ai"
    install -dm755 "$pkgdir/usr/share/applications"
    printf '[Desktop Entry]\nType=Application\nName=Luna AI\nComment=AI assistant for Arch+Hyprland\nExec=luna-ai\nIcon=luna-ai\nTerminal=false\nCategories=Utility;\n' > "$pkgdir/usr/share/applications/luna-ai.desktop"
    install -dm755 "$pkgdir/usr/share/licenses/luna-ai"
    echo "MIT License" > "$pkgdir/usr/share/licenses/luna-ai/LICENSE"
>>>>>>> 7aa55c31ce4cef176aab103286f2312eb28fa13d
}
