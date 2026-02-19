# Maintainer: Robin Darlington <mail@robindarlington.com>
pkgname=linuxwhisper-git
pkgver=0.1.0.r72.1ca68fb
pkgrel=1
pkgdesc="Linux desktop voice dictation tool using local Whisper"
arch=('x86_64')
url="https://github.com/robindarlington/linuxwhisper"
license=('MIT')
depends=(
    'python>=3.11'
    'python-click'
    'python-tomli-w'
    'python-xdg-base-dirs'
    'python-evdev'
    'python-sounddevice'
    'python-faster-whisper'
    'python-scipy'
    'python-gobject'
    'gtk4'
    'gtk4-layer-shell'
    'portaudio'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-setuptools-scm'
)
optdepends=(
    'ydotool: text injection on Wayland (recommended)'
    'wtype: alternative Wayland text injection for wlroots compositors'
    'xdotool: text injection on X11'
    'wl-clipboard: clipboard-based text injection fallback on Wayland'
    'xclip: clipboard-based text injection fallback on X11'
)
provides=('linuxwhisper')
conflicts=('linuxwhisper')
install=linuxwhisper.install
source=("${pkgname}::git+https://github.com/robindarlington/linuxwhisper.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    if git describe --tags --long --abbrev=7 2>/dev/null; then
        git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"

    # Install the wheel
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install systemd user service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/linuxwhisper.service" <<'EOF'
[Unit]
Description=LinuxWhisper voice dictation daemon
After=graphical-session.target
PartOf=graphical-session.target
Wants=ydotool.service
StartLimitIntervalSec=300
StartLimitBurst=5

[Service]
Type=simple
ExecStart=/usr/bin/python -m linuxwhisper
ExecReload=/bin/kill -HUP $MAINPID
Restart=on-failure
RestartSec=5
Environment=PYTHONUNBUFFERED=1
TimeoutStopSec=10

[Install]
WantedBy=graphical-session.target
EOF

    # Install udev rule for uinput access
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/udev/rules.d/80-linuxwhisper-uinput.rules" <<'EOF'
KERNEL=="uinput", GROUP="input", MODE="0660"
EOF

    # Install modules-load.d config for uinput kernel module
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/linuxwhisper-uinput.conf" <<'EOF'
uinput
EOF
}
