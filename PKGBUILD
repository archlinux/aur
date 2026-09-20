# Maintainer: Rockykln <contact@rockykln.com>

pkgname=refrain-git
_pkgname=refrain
pkgver=0.5.3.r211.g4118136
pkgrel=1
pkgdesc="Discord Rich Presence for Apple Music on Linux (git)"
arch=('any')
url="https://github.com/Rockykln/refrain"
license=('LicenseRef-RefrainUseOnly')
depends=(
    'python>=3.11'
    'python-pypresence'
    'python-dbus'
    'pyside6'
)
optdepends=(
    'python-gobject: enables MPRIS-server publication so Plasma media controls reach Refrain'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/Rockykln/refrain.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    local _ver
    _ver=$(grep -m1 '^version' pyproject.toml | cut -d'"' -f2)
    printf "%s.r%s.g%s" \
        "$_ver" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 src/refrain/assets/refrain.desktop \
        "$pkgdir/usr/share/applications/refrain.desktop"
    install -Dm644 src/refrain/assets/icons/refrain.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/refrain.svg"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
