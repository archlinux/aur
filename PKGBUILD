# Maintainer: goun7 <https://github.com/goun7/pkgforge>
pkgname=pkgforge
pkgver=2.2.0
pkgrel=1
pkgdesc="Modern .deb/.rpm package converter, safety analyzer, and lifecycle manager for Arch Linux"
arch=('any')
url="https://github.com/goun7/pkgforge"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'pacman'
    'fakeroot'
    'libarchive'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-pyqt6: GUI interface (pkgforge gui)'
    'python-pyqt6-sip: GUI interface'
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
# NOTE: sha256 verified against the published v2.1.0 tag tarball (2026-09-07).
source=("$pkgver.tar.gz::https://github.com/goun7/pkgforge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68c3f8734582ba17ab62805b9d547ad6fba86dcd9c20f3ab6b1036531479cf6b')

prepare() {
    cd "$srcdir/pkgforge-$pkgver"
    # No special prepare needed
}

build() {
    cd "$srcdir/pkgforge-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pkgforge-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Remove __pycache__ directories (bytecode — unnecessary in packages)
    find "$pkgdir" -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

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
