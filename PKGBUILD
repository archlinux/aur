# Maintainer: Mathias Maisberger <me@hiasinho.com>
pkgname=hammertalk-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Push-to-talk transcription daemon for Wayland (Sway, Hyprland, niri, COSMIC)"
arch=('x86_64')
url="https://github.com/hiasinho/hammertalk"
license=('MIT')
depends=('ydotool' 'gcc-libs')
optdepends=(
    'pipewire: audio capture'
    'pulseaudio: audio capture (alternative)'
)
provides=('hammertalk')
conflicts=('hammertalk' 'hammertalk-git')
source=("hammertalk-${pkgver}::https://github.com/hiasinho/hammertalk/releases/download/v${pkgver}/hammertalk"
        "hammertalk-ctl-${pkgver}::https://github.com/hiasinho/hammertalk/releases/download/v${pkgver}/hammertalk-ctl"
        "download-model.sh-${pkgver}::https://github.com/hiasinho/hammertalk/releases/download/v${pkgver}/download-model.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
install=hammertalk-bin.install

package() {
    # Binary
    install -Dm755 "hammertalk-${pkgver}" "$pkgdir/usr/bin/hammertalk"

    # Control script
    install -Dm755 "hammertalk-ctl-${pkgver}" "$pkgdir/usr/bin/hammertalk-ctl"

    # Systemd user service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/hammertalk.service" <<EOF
[Unit]
Description=Push-to-talk transcription daemon for Wayland
After=pipewire.service

[Service]
ExecStart=/usr/bin/hammertalk
Restart=on-failure
RestartSec=5
Environment=RUST_LOG=info

[Install]
WantedBy=default.target
EOF

    # Model download script
    install -Dm755 "download-model.sh-${pkgver}" "$pkgdir/usr/share/hammertalk/download-model.sh"

    # License
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
MIT License

Copyright (c) 2026 Mathias Maisberger

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
