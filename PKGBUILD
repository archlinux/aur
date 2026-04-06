pkgname=luna-ai
pkgver=6.1.0
pkgrel=1
pkgdesc="Luna AI v6 — Hacker-style voice AI desktop assistant"
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/luna-ai"
license=('MIT')

depends=(
    'python>=3.10'
    'python-pyqt6'
    'python-requests'
    'python-beautifulsoup4'
    'python-psutil'
    'mpv'
)

optdepends=(
    'ffmpeg: audio fallback'
    'python-pygame: audio playback'
    'brightnessctl: brightness control'
    'yt-dlp: YouTube playback'
    'xdotool: X11 control'
    'ydotool: Wayland control'
    'python-speechrecognition: voice input'
    'python-pyaudio: mic support'
)

source=("luna-ai-$pkgver.tar.gz::https://github.com/Arunachalam-gojosaturo/luna-ai/archive/v$pkgver.tar.gz")
sha256sums=('fcb6f1c39ea1c84d119aaa0c8fad4e54faa0b64af3fa157bc6f6f8266612d8c1')

package() {
    cd "$srcdir/luna-ai-$pkgver"

    install -dm755 "$pkgdir/usr/lib/luna-ai"
    cp -r * "$pkgdir/usr/lib/luna-ai"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/luna-ai" << EOF
#!/usr/bin/env bash
export DISPLAY="\${DISPLAY:-:0}"
export XDG_RUNTIME_DIR="\${XDG_RUNTIME_DIR:-/run/user/\$(id -u)}"
export WAYLAND_DISPLAY="\${WAYLAND_DISPLAY:-wayland-1}"
export QT_QPA_PLATFORM="\${QT_QPA_PLATFORM:-wayland}"
export MOZ_ENABLE_WAYLAND=1

exec /usr/bin/python /usr/lib/luna-ai/main.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/luna-ai"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/luna-ai/LICENSE"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/luna-ai.desktop" << EOF
[Desktop Entry]
Name=Luna AI
Comment=Hacker AI assistant
Exec=luna-ai
Terminal=false
Type=Application
Categories=Utility;
EOF
}
