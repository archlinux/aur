# Maintainer: Scott Stavinoha <scottstavinoha@gmail.com>
pkgname=aside
pkgver=0.4.0
pkgrel=1
pkgdesc="LLM assistant for Wayland desktops — overlay, voice, tools, any model"
arch=('x86_64')
url="https://github.com/scottstav/aside"
license=('MIT')
depends=(
    'wayland'
    'cairo'
    'pango'
    'json-c'
    'pipewire'
    'gtk4'
    'libadwaita'
    'gtk4-layer-shell'
    'portaudio'
    'python'
    'python-gobject'
    'python-cairo'
    'python-tiktoken'
    'python-openai'
    'python-pydantic'
    'python-aiohttp'
    'python-httpx'
    'gobject-introspection'
)
makedepends=(
    'meson'
    'ninja'
    'python-build'
    'python-wheel'
    'meson-python'
    'python-pip'
    'python-setuptools'
    'wayland-protocols'
)
optdepends=(
    # STT: sudo aside enable-stt (faster-whisper, ~100MB)
    # TTS: sudo aside enable-tts (piper-tts)
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('d455a148df0cd3544d1bab8ef3bb072de48d14fdd7be3dc8c2b176cb65b6cfb2')

build() {
    # Build aside wheel (C overlay + Python package)
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation

    # Create venv with access to system site-packages so distro-provided
    # C extensions (numpy, PyGObject, pycairo) are used directly.
    python -m venv --system-site-packages "$srcdir/venv"
    local _pip="$srcdir/venv/bin/pip"

    # Install aside (no-deps: we install deps explicitly below)
    "$_pip" install --no-cache-dir --no-deps \
        "$srcdir/$pkgname-$pkgver/dist/aside_assistant-"*.whl

    # Install litellm — heavy deps (tiktoken, openai, pydantic, aiohttp, httpx)
    # come from system packages via --system-site-packages, so pip only pulls
    # the lightweight remainder.
    "$_pip" install --no-cache-dir litellm
}

package() {
    # ── venv ──────────────────────────────────────────────────────────────
    install -d "$pkgdir/opt"
    cp -a "$srcdir/venv" "$pkgdir/opt/aside"

    # Fix hardcoded $srcdir/venv paths → /opt/aside
    find "$pkgdir/opt/aside/bin" -type f -exec \
        sed -i "s|$srcdir/venv|/opt/aside|g" {} +
    sed -i "s|$srcdir/venv|/opt/aside|g" "$pkgdir/opt/aside/pyvenv.cfg"

    # ── wrapper scripts ──────────────────────────────────────────────────
    install -d "$pkgdir/usr/bin"
    for cmd in aside aside-input aside-reply aside-overlay aside-status; do
        [ -f "$pkgdir/opt/aside/bin/$cmd" ] || continue
        cat > "$pkgdir/usr/bin/$cmd" <<EOF
#!/bin/sh
exec /opt/aside/bin/$cmd "\$@"
EOF
        chmod 755 "$pkgdir/usr/bin/$cmd"
    done

    cd "$srcdir/$pkgname-$pkgver"

    # ── systemd units (patched for /usr/bin paths) ────────────────────────
    install -Dm644 data/aside-daemon.service "$pkgdir/usr/lib/systemd/user/aside-daemon.service"
    install -Dm644 data/aside-overlay.service "$pkgdir/usr/lib/systemd/user/aside-overlay.service"
    sed -i 's|%h/.local/bin/aside|/usr/bin/aside|' \
        "$pkgdir/usr/lib/systemd/user/aside-daemon.service"
    sed -i 's|%h/.local/bin/aside-overlay|/usr/bin/aside-overlay|' \
        "$pkgdir/usr/lib/systemd/user/aside-overlay.service"

    # ── desktop entry ─────────────────────────────────────────────────────
    install -Dm644 data/aside.desktop "$pkgdir/usr/share/applications/aside.desktop"

    # ── example config ────────────────────────────────────────────────────
    install -Dm644 data/config.toml.example "$pkgdir/usr/share/aside/config.toml.example"

    # ── license ───────────────────────────────────────────────────────────
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
