# Maintainer: Ronak Mehta <ronakrm@gmail.com>
pkgname=talkat
pkgver=0.2.0
pkgrel=1
pkgdesc="Voice-to-text dictation system for Wayland Linux compositors"
arch=('any')
url="https://github.com/ronakrm/talkat"
license=('MIT')
depends=(
    'python'       # Interpreter the bundled venv symlinks to (>=3.11)
    'portaudio'    # Audio I/O library
    'ydotool'      # Wayland input automation
)
optdepends=(
    'wl-clipboard: Clipboard support on Wayland'
    'xclip: Clipboard support on X11'
    'libnotify: Desktop notifications'
)
options=('!strip')  # Disable stripping for faster builds (contains large venv)
makedepends=(
    'git'
    'uv'           # Build-time only — used to create the venv and install deps
)
install=talkat.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('84d8982721c18f5b1794a9ecb40ba6a46db0eccb94e0aba27e34f5cb47b23f06')

build() {
    cd "$pkgname-$pkgver"

    # Nothing to do here - we'll create venv during package()
    # so it has the correct paths from the start
}

package() {
    cd "$pkgname-$pkgver"

    # Create virtual environment at its final location
    # This ensures all shebangs and paths are correct
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    uv venv "$pkgdir/usr/lib/$pkgname/.venv"

    # Install the package into the venv using uv pip
    # Use --python to target the specific venv we just created
    uv pip install --python "$pkgdir/usr/lib/$pkgname/.venv/bin/python" .

    # Create wrapper script in /usr/bin that uses the venv
    # Use python -m to avoid relying on entry point scripts with hardcoded shebangs
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/talkat" << 'EOF'
#!/bin/bash
exec /usr/lib/talkat/.venv/bin/python -m talkat.cli "$@"
EOF
    chmod +x "$pkgdir/usr/bin/talkat"

    # Create systemd user service (don't use repo's template version)
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    cat > "$pkgdir/usr/lib/systemd/user/talkat.service" << 'EOF'
[Unit]
Description=Talkat Voice Dictation Server
Documentation=https://github.com/ronakrm/talkat
After=sound.target

[Service]
Type=simple
ExecStart=/usr/bin/talkat server
Restart=on-failure
RestartSec=5
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=default.target
EOF

    # Install desktop file
    install -Dm644 talkat.desktop "$pkgdir/usr/share/applications/talkat.desktop"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
