# Maintainer: Scott Stavinoha <scottstavinoha@gmail.com>
pkgname=aside
pkgver=0.6.1
pkgrel=1
pkgdesc="LLM assistant for Wayland desktops — overlay, voice, tools, any model"
arch=('x86_64')
url="https://github.com/scottstav/aside"
license=('MIT')
depends=(
    'gtk4'
    'libadwaita'
    'gtk4-layer-shell'
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
    'python-build'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'portaudio: voice input (aside enable-stt)'
    'pipewire: voice input via pw-record'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('22d363478b8cf7ad8003511224e697d926afaec395563fbb794bc94d3f254e34')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation

    python -m venv --system-site-packages "$srcdir/venv"
    local _pip="$srcdir/venv/bin/pip"

    "$_pip" install --no-cache-dir --no-deps \
        "$srcdir/$pkgname-$pkgver/dist/aside_assistant-"*.whl

    "$_pip" install --no-cache-dir litellm mistune
}

package() {
    # ── venv ──────────────────────────────────────────────────────────────
    install -d "$pkgdir/opt"
    cp -a "$srcdir/venv" "$pkgdir/opt/aside"

    find "$pkgdir/opt/aside/bin" -type f -exec \
        sed -i "s|$srcdir/venv|/opt/aside|g" {} +
    sed -i "s|$srcdir/venv|/opt/aside|g" "$pkgdir/opt/aside/pyvenv.cfg"

    # ── wrapper scripts ──────────────────────────────────────────────────
    install -d "$pkgdir/usr/bin"
    for cmd in aside aside-overlay; do
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
