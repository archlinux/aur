# Maintainer: Ronak Mehta <ronakrm@gmail.com>
pkgname=talkat
pkgver=1.1.0
pkgrel=1
pkgdesc="Voice-to-text dictation system for Wayland Linux compositors"
arch=('x86_64')
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
sha256sums=('6602e608d76ffa569d612c86e616341a46db604f57a1444fdc4d639fe781f975')

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

    # Sync against the committed uv.lock for a reproducible build.
    # UV_PROJECT_ENVIRONMENT redirects the venv creation to the final pkg path.
    # --python forces Arch's system interpreter so the venv symlinks to a path
    # that exists on every user's machine (overrides upstream's .python-version,
    # which would otherwise pull uv-managed Python into the build host's homedir).
    UV_PROJECT_ENVIRONMENT="$pkgdir/usr/lib/$pkgname/.venv" \
        uv sync --frozen --no-dev --no-editable --python /usr/bin/python

    # uv leaves a world-writable .lock in the venv; not needed at runtime.
    rm -f "$pkgdir/usr/lib/$pkgname/.venv/.lock"

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

    # Smoke-test the built venv. The /usr/bin wrapper hard-codes
    # /usr/lib/talkat/.venv which doesn't exist on the build host, so invoke
    # the staged venv's python directly. A broken install fails makepkg here.
    "$pkgdir/usr/lib/$pkgname/.venv/bin/python" -m talkat.cli --help >/dev/null
}
