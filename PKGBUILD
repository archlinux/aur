# Maintainer: goun7 <https://github.com/goun7/pkgforge>
# AUR development package — tracks master. For the stable release see
# the PKGBUILD at the repo root (needs a release tag + sha256).
pkgname=pkgforge-git
pkgver=2.0.0.r95.gf6e0f74
pkgrel=1
pkgdesc="Convert .deb/.rpm packages to Arch Linux with sandbox, SBOM and Tauri desktop (git)"
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
    'python-pyqt6: legacy GUI (pkgforge gui, frozen)'
    'python-fastapi: REST API (pkgforge serve-api)'
    'python-uvicorn: REST API server'
    'namcap: Static package analysis'
    'bubblewrap: Build sandbox isolation'
    'rpmextract: RPM extraction support'
    'distrobox: Container fallback support'
    'clamav: Malware scanning'
    'trivy: OCI image security scanning'
    'xdelta3: Binary delta updates'
    'gnupg: Package signing'
)
provides=('pkgforge')
conflicts=('pkgforge')
source=("git+https://github.com/goun7/pkgforge.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/pkgforge"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "2.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/pkgforge"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pkgforge"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Remove __pycache__ directories (bytecode — unnecessary in packages)
    find "$pkgdir" -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    # Desktop entry, icon, metainfo, polkit policy, completions and helper
    # scripts are shipped by the wheel's data-files and already installed by
    # `python -m installer` above.

    # Install systemd timer for delta auto-updates
    if [ -f data/pkgforge-delta.service ]; then
        install -Dm644 data/pkgforge-delta.service "$pkgdir/usr/lib/systemd/system/pkgforge-delta.service"
        install -Dm644 data/pkgforge-delta.timer "$pkgdir/usr/lib/systemd/system/pkgforge-delta.timer"
    fi
}
