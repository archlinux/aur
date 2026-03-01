# Maintainer: Scott Stavropoulos <scottstav@gmail.com>
pkgname=aside
pkgver=0.1.0
pkgrel=1
_piperver=1.4.1
pkgdesc="Wayland-native LLM desktop assistant"
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
    'gtk4-layer-shell'
    'portaudio'
    'espeak-ng'
    'python'
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
    'python-scikit-build'
    'wayland-protocols'
    'cmake'
)
optdepends=(
    'grim: screenshot plugin'
    'slurp: screenshot region selection'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    "piper1-gpl-$_piperver.tar.gz::https://github.com/OHF-Voice/piper1-gpl/archive/v$_piperver.tar.gz"
    "en_US-lessac-medium.onnx::https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium/en_US-lessac-medium.onnx"
    "en_US-lessac-medium.onnx.json::https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium/en_US-lessac-medium.onnx.json"
)
sha256sums=('1a0293ec8e80938bb87d1a0ca8769a9bcfdc364fb9d943d17884dafab9301ab2'
            '2ed52a87bb7a2b7a181f6ad38d8f78f3f753ff9fc02c68377e897f20b6ae8247'
            '5efe09e69902187827af646e1a6e9d269dee769f9877d17b16b1b46eeaaf019f'
            'efe19c417bed055f2d69908248c6ba650fa135bc868b0e6abb3da181dab690a0')

prepare() {
    cd "$srcdir/piper1-gpl-$_piperver"
    sed -i 's/"cmake", "ninja"//' pyproject.toml
}

build() {
    # Build aside wheel (C overlay + Python package)
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation

    # Build piper-tts wheel from source
    cd "$srcdir/piper1-gpl-$_piperver"
    python -m build --wheel --no-isolation

    # Create fully isolated venv
    python -m venv "$srcdir/venv"
    local _pip="$srcdir/venv/bin/pip"

    # Install aside (no-deps: we install deps explicitly below)
    "$_pip" install --no-cache-dir --no-deps \
        "$srcdir/$pkgname-$pkgver/dist/aside_assistant-"*.whl

    # Install piper-tts from the wheel we just built
    "$_pip" install --no-cache-dir --no-deps \
        "$srcdir/piper1-gpl-$_piperver/dist/"piper_tts-*.whl
    "$_pip" install --no-cache-dir onnxruntime pathvalidate

    # Install all remaining Python deps
    "$_pip" install --no-cache-dir \
        litellm faster-whisper sounddevice soundfile \
        numpy webrtcvad-wheels PyGObject pycairo
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

    # ── default TTS voice model ───────────────────────────────────────────
    install -Dm644 "$srcdir/en_US-lessac-medium.onnx" \
        "$pkgdir/usr/share/piper-voices/en/en_US/lessac/medium/en_US-lessac-medium.onnx"
    install -Dm644 "$srcdir/en_US-lessac-medium.onnx.json" \
        "$pkgdir/usr/share/piper-voices/en/en_US/lessac/medium/en_US-lessac-medium.onnx.json"

    # ── license ───────────────────────────────────────────────────────────
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
