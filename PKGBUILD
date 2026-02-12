# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
pkgname=flyprint-git
pkgver=0.1.0.r4.g43eb4fb
pkgrel=1
pkgdesc="Local print agent for FlyPush label printing (system tray + headless)"
arch=('any')
url="https://github.com/ggilestro/flyPrint"
license=('MIT')
depends=(
    'python>=3.10'
    'python-click'
    'python-requests'
    'python-pystray'
    'python-pillow'
    'python-pycups'
    'tk'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatchling'
)
provides=('flyprint')
conflicts=('flyprint')
source=("${pkgname}::git+https://github.com/ggilestro/flyPrint.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    if git describe --long --tags 2>/dev/null; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$pkgname"
    pyproject-build --wheel --no-isolation
}

package() {
    cd "$pkgname"

    # Install the wheel
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install .desktop file
    install -Dm644 "$srcdir/../flyprint.desktop" \
        "$pkgdir/usr/share/applications/flyprint.desktop"

    # Install icon
    install -Dm644 flyprint/assets/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/flyprint.png"

    # Install systemd user service
    install -Dm644 "$srcdir/../flyprint.service" \
        "$pkgdir/usr/lib/systemd/user/flyprint.service"

    # Install license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
