# Maintainer: goun7 <https://github.com/goun7/pkgforge>
pkgname=pkgforge
pkgver=2.2.0
pkgrel=3
pkgdesc="Modern .deb/.rpm package converter, safety analyzer, and lifecycle manager for Arch Linux"
arch=('x86_64')
url="https://github.com/goun7/pkgforge"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'pacman'
    'fakeroot'
    'libarchive'
    'python-pydantic'
    'hicolor-icon-theme'
    'webkit2gtk-4.1'
    'gtk3'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'nodejs'
    'npm'
    'rust'
    'cairo'
    'pango'
    'atk'
    'gdk-pixbuf2'
    'libsoup3'
)
optdepends=(
    'python-pyqt6: Legacy GUI interface (pkgforge gui)'
    'python-pyqt6-sip: Legacy GUI interface'
    'python-fastapi: REST API (pkgforge serve-api)'
    'python-uvicorn: REST API server'
    'namcap: Static package analysis'
    'bubblewrap: Build sandbox isolation'
    'debtap: Legacy DEB conversion fallback'
    'rpmextract: RPM extraction support'
    'distrobox: Container fallback support'
    'clamav: Malware scanning'
    'trivy: OCI image security scanning'
    'xdelta3: Binary delta updates'
    'gnupg: Package signing'
)
provides=('pkgforge')
conflicts=('pkgforge')
# NOTE: sha256 verified against the published v2.2.0 tag tarball (2026-09-17).
# 2.2.0-3: Tauri desktop binary + sidecar derlenip pakete eklendi; namcap'in
# isaret ettigi python-pydantic ve hicolor-icon-theme bagimliliklari
# giderildi. Onceki 2.2.0-1 yalnizca Python wheel'ini iceriyordu (modern
# arayuz AUR kullanicilarina ulasmiyordu).
source=("$pkgver.tar.gz::https://github.com/goun7/pkgforge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8181dda7e44bd07e8cfc7f5e40b281a00327b085240717510a7434ea987302e')

build() {
    cd "$srcdir/pkgforge-$pkgver"
    python -m build --wheel --no-isolation

    # Tauri desktop binary + Python sidecar (offline, CDN'siz modern UI).
    # build-sidecar.sh bir venv ister (PyInstaller oradan calisir); AUR
    # derleme ortaminda sistem Python'i ile sade venv olustur.
    python -m venv .venv
    .venv/bin/pip install --quiet --upgrade pip
    .venv/bin/pip install --quiet pyinstaller
    .venv/bin/pip install --quiet --no-deps .

    cd desktop
    # package-lock.json git'te takip edilmediginden tarbolda yok; npm ci
    # (kilit dosyasi zorunlu) calismaz. npm install kullan.
    npm install --ignore-scripts
    VENV_PY="$srcdir/pkgforge-$pkgver/.venv/bin/python" ./scripts/build-sidecar.sh
    cd src-tauri
    ../node_modules/.bin/tauri build --no-bundle
    cd "$srcdir/pkgforge-$pkgver"
}

package() {
    cd "$srcdir/pkgforge-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Remove __pycache__ directories (bytecode — unnecessary in packages)
    find "$pkgdir" -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    # Tauri desktop binary + sidecar
    install -Dm755 "desktop/src-tauri/target/release/pkgforge-desktop" \
        "$pkgdir/usr/lib/pkgforge/desktop/pkgforge-desktop"
    install -Dm755 "desktop/src-tauri/target/release/pkgforge-sidecar" \
        "$pkgdir/usr/lib/pkgforge/desktop/pkgforge-sidecar"

    # Desktop entry, icon, metainfo, polkit policy, completions and helper
    # scripts are shipped by the wheel's data-files and already installed by
    # `python -m installer` above — do NOT reinstall them here (a manual
    # install previously produced a duplicate menu entry under a second name).

    # Install systemd timer for delta auto-updates
    if [ -f data/pkgforge-delta.service ]; then
        install -Dm644 data/pkgforge-delta.service "$pkgdir/usr/lib/systemd/system/pkgforge-delta.service"
        install -Dm644 data/pkgforge-delta.timer "$pkgdir/usr/lib/systemd/system/pkgforge-delta.timer"
    fi
}
