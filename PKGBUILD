# Maintainer: litescript <your@email.com>
pkgname=omnote-git
pkgver=1.0.0.r22.g98b27b3
pkgrel=1
pkgdesc="Minimalist plain-text notepad for Linux (GTK4 + libadwaita)"
arch=('any')
url="https://github.com/litescript/OmNote"
license=('MIT')
depends=(
    'python>=3.11'
    'python-gobject'
    'gtk4'
    'libadwaita'
)
optdepends=('python-pyyaml: YAML theme config parsing')
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'git'
)
provides=('omnote')
conflicts=('omnote')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Desktop entry
    install -Dm644 dist/dev.omarchy.OmNote.desktop \
        "$pkgdir/usr/share/applications/dev.omarchy.OmNote.desktop"

    # Icon
    install -Dm644 assets/dev.omarchy.OmNote.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.omarchy.OmNote.svg"

    # License
    install -Dm644 LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
