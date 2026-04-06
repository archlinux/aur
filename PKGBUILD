# Maintainer: Arunachalam-gojosaturo <cutyarunachalam1@gmail.com>

pkgname=luna-ai
pkgver=6.1.0
pkgrel=1
pkgdesc="Luna AI v6 — Hacker-style voice AI desktop assistant"
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/Luna-ai"
license=('MIT')

depends=(
    'python>=3.10'
    'python-pyqt6'
    'python-requests'
    'python-psutil'
    'python-beautifulsoup4'
    'mpv'
)

optdepends=(
    'yt-dlp: YouTube playback'
    'python-pygame: audio fallback'
    'python-speechrecognition: voice input'
    'python-pyaudio: microphone support'
)

source=("luna-ai-$pkgver.tar.gz::https://github.com/Arunachalam-gojosaturo/Luna-ai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"

    # Find extracted folder safely (handles case differences)
    srcdir_name=$(find . -maxdepth 1 -type d -name "*[Ll]una-ai*" | head -n1)
    cd "$srcdir_name"

    # Install app files
    install -dm755 "$pkgdir/usr/lib/luna-ai"
    cp -r . "$pkgdir/usr/lib/luna-ai"

    # Launcher
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

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/luna-ai.desktop" << EOF
[Desktop Entry]
Name=Luna AI
Comment=Hacker AI assistant with voice control
Exec=luna-ai
Terminal=false
Type=Application
Categories=Utility;
EOF

    # License (safe)
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/luna-ai/LICENSE"
    fi
}
