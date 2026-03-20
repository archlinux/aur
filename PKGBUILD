# Maintainer: AJV009 <jaimonalphons@gmail.com>
pkgname=meeting-recorder
pkgver=2.0.0
pkgrel=1
pkgdesc="Record, transcribe and summarize meetings with AI"
arch=('any')
url="https://github.com/AJV009/meeting-recorder"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk3'
    'python-cairo'
    'python-pystray'
    'python-pillow'
    'python-setproctitle'
    'libnotify'
    'ffmpeg'
    'pipewire'
    'pipewire-pulse'
    'wireplumber'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-pip'
)
optdepends=(
    'gpu-screen-recorder: screen recording support'
    'ollama: local LLM summarization'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AJV009/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    # Install into a venv to handle pip-only deps (litellm, google-genai, etc.)
    python -m venv "$pkgdir/opt/$pkgname/.venv" --system-site-packages
    "$pkgdir/opt/$pkgname/.venv/bin/pip" install --quiet --no-deps dist/*.whl
    "$pkgdir/opt/$pkgname/.venv/bin/pip" install --quiet dist/*.whl

    # Fix venv paths: replace $pkgdir prefix in shebangs and pyvenv.cfg
    local _venv="$pkgdir/opt/$pkgname/.venv"
    sed -i "s|$pkgdir||g" "$_venv/bin/"* "$_venv/pyvenv.cfg" 2>/dev/null || true

    # Launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'LAUNCHER'
#!/usr/bin/env bash
exec /opt/meeting-recorder/.venv/bin/meeting-recorder "$@"
LAUNCHER

    # Desktop entry
    install -Dm644 "assets/meeting-recorder.desktop" \
        "$pkgdir/usr/share/applications/meeting-recorder.desktop"

    # Icon
    install -Dm644 "src/meeting_recorder/assets/icons/meeting-recorder.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/meeting-recorder.svg"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
