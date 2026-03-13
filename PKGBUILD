# Maintainer: Arunachalam <cutyarunachalam1@gmail.com>
pkgname=luna-ai
pkgver=1.0.0
pkgrel=1
pkgdesc="Luna AI - Hacker-style voice AI assistant for Arch Linux + Hyprland (YouTube, brightness, volume, live crypto/weather)"
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/Luna-ai"
license=('MIT')
depends=(
    'python>=3.10'
    'python-pyqt6'
    'firefox'
    'brightnessctl'
    'pipewire'
    'pipewire-pulse'
    'wireplumber'
    'yt-dlp'
    'xdotool'
    'python-requests'
    'python-psutil'
)
optdepends=(
    'ydotool: Wayland native input control'
    'python-speechrecognition: Microphone voice input'
    'python-pyaudio: Microphone hardware support'
)
makedepends=('python-pip')
provides=('luna-ai')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Arunachalam-gojosaturo/Luna-ai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1cef2fe95aceac02d5908fa31eb1e300a87a91f7f898803be6eb6e6d3baa084d')

package() {
    SRCDIR="$srcdir/Luna-ai-$pkgver"
    [ -d "$SRCDIR" ] || SRCDIR="$srcdir"

    install -dm755 "$pkgdir/opt/luna-ai"
    cp -r "$SRCDIR"/. "$pkgdir/opt/luna-ai/"
    rm -rf "$pkgdir/opt/luna-ai/.git" "$pkgdir/opt/luna-ai/venv" "$pkgdir/opt/luna-ai/__pycache__" 2>/dev/null || true

    # Pip deps not in official repos
    install -dm755 "$pkgdir/opt/luna-ai/vendor"
    pip install --no-deps --target="$pkgdir/opt/luna-ai/vendor" edge-tts google-genai groq 2>/dev/null || true

    # Launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/luna-ai" << 'BINEOF'
#!/usr/bin/env bash
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=/run/user/$(id -u)/bus}"
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export PYTHONPATH="/opt/luna-ai/vendor:$PYTHONPATH"
cd /opt/luna-ai
exec python /opt/luna-ai/main.py "$@"
BINEOF
    chmod 755 "$pkgdir/usr/bin/luna-ai"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/luna-ai.desktop" << 'DEOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Luna AI
Comment=Hacker-style AI assistant for Arch Linux + Hyprland
Exec=luna-ai
Icon=luna-ai
Terminal=false
Categories=Utility;Science;
Keywords=AI;Voice;Assistant;Luna;
DEOF

    # Icon
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    cat > "$pkgdir/usr/share/icons/hicolor/scalable/apps/luna-ai.svg" << 'SVGEOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <rect width="64" height="64" rx="12" fill="#050510"/>
  <circle cx="32" cy="32" r="15" fill="none" stroke="#00dc8c" stroke-width="1.5" opacity="0.6"/>
  <circle cx="32" cy="32" r="6" fill="#00dc8c"/>
  <circle cx="32" cy="32" r="3" fill="#ffffff"/>
  <line x1="32" y1="8" x2="32" y2="17" stroke="#00dc8c" stroke-width="1.5" opacity="0.7"/>
  <line x1="32" y1="47" x2="32" y2="56" stroke="#00dc8c" stroke-width="1.5" opacity="0.7"/>
  <line x1="8" y1="32" x2="17" y2="32" stroke="#00dc8c" stroke-width="1.5" opacity="0.7"/>
  <line x1="47" y1="32" x2="56" y2="32" stroke="#00dc8c" stroke-width="1.5" opacity="0.7"/>
</svg>
SVGEOF

    install -dm755 "$pkgdir/usr/share/licenses/luna-ai"
    install -Dm644 "$SRCDIR/LICENSE" "$pkgdir/usr/share/licenses/luna-ai/LICENSE" 2>/dev/null || true
}
