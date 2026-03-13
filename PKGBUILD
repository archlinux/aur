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
}
