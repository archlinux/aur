# Maintainer: Vatteck <vatteck@gmail.com>
pkgname=atlas-pm-git
_srcname=atlas
pkgver=0.10.7
pkgrel=1
pkgdesc="Arch-focused graphical package manager (Arch/AUR, Flatpak, AppImage)"
arch=('any')
url="https://github.com/Vatteck/atlas"
license=('Zlib')
depends=(
    'python'
    'python-pywebview'
    'webkit2gtk-4.1'
    'gtk3'
    'python-gobject'
    'python-requests'
    'python-yaml'
    'python-dateutil'
    'python-colorama'
    'pacman'
)
optdepends=(
    'flatpak: manage Flatpak applications'
    'git: build packages from the AUR'
    'timeshift: system snapshot before applying changes'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('atlas-pm')
conflicts=('atlas-pm')
source=("git+https://github.com/Vatteck/atlas.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    local ver
    ver="$(sed -n "s/^__version__ = ['\"]\([^'\"]*\)['\"].*/\1/p" atlas/__init__.py)"
    printf "%s.r%s.g%s" "${ver:-0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_srcname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_srcname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # desktop entry + icon. Named 'atlas-pm' (not 'atlas') so it doesn't collide with the
    # generic 'atlas' map icon some themes ship. logo.png is 512x512, so install it to the
    # hicolor 512x512 dir (what GNOME/KDE app grids actually search) plus pixmaps as a
    # legacy fallback; the .desktop's Icon=atlas-pm resolves to it.
    install -Dm644 atlas/desktop/atlas.desktop "$pkgdir/usr/share/applications/atlas.desktop"
    install -Dm644 atlas/view/resources/img/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/atlas-pm.png"
    install -Dm644 atlas/view/resources/img/logo.png "$pkgdir/usr/share/pixmaps/atlas-pm.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
