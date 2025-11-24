# Maintainer: Niklas Aldervall <aldervall@users.noreply.github.com>
pkgname=voicetype-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Local English voice transcription using whisper.cpp with hold-to-speak daemon'
arch=('x86_64')
url='https://github.com/aldervall/Voicetype'
license=('MIT')
depends=(
    'python'
    'python-requests'
    'python-sounddevice'
    'python-scipy'
    'python-numpy'
    'python-evdev'
)
optdepends=(
    'ydotool: for auto-paste in daemon mode (recommended)'
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'libnotify: desktop notifications'
    'pulseaudio: audio feedback beeps'
)
provides=('voicetype')
conflicts=('voicetype')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('36b080ff8a85675fdba0db568b2dff024f5e11dd6f1db02524d328918a803371')
install=voicetype.install

package() {
    cd "$srcdir/Voicetype-$pkgver"

    # Install Python modules
    install -dm755 "$pkgdir/usr/lib/voicetype"
    install -Dm644 src/*.py -t "$pkgdir/usr/lib/voicetype/"

    # Install whisper-server binary
    install -dm755 "$pkgdir/usr/lib/voicetype/whisper/bin"
    install -Dm755 .whisper/bin/whisper-server-linux-x64 \
        "$pkgdir/usr/lib/voicetype/whisper/bin/whisper-server"

    # Install helper scripts
    install -dm755 "$pkgdir/usr/lib/voicetype/whisper/scripts"
    install -Dm755 .whisper/scripts/*.sh -t "$pkgdir/usr/lib/voicetype/whisper/scripts/"

    # Install launcher scripts
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/voicetype-daemon" <<'EOF'
#!/bin/bash
# VoiceType daemon launcher
cd /usr/lib/voicetype
exec python -m voice_holdtospeak "$@"
EOF

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/voicetype-input" <<'EOF'
#!/bin/bash
# VoiceType one-shot voice input
cd /usr/lib/voicetype
exec python -m voice_to_text "$@"
EOF

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/voicetype-stop-server" <<'EOF'
#!/bin/bash
# Stop whisper.cpp server
pkill -f "whisper-server" && echo "Whisper server stopped" || echo "No server running"
EOF

    # Install systemd user service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/voicetype-daemon.service" <<'EOF'
[Unit]
Description=VoiceType Hold-to-Speak Daemon
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/voicetype-daemon
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
