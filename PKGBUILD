# Maintainer: Antonios Rainakis <antonyrai26@gmail.com> 
pkgname=unidesk-git
_pkgname=unidesk
pkgver=r129.dd9049b
pkgrel=1
pkgdesc="Welcome and academic configuration app for UniOS"
arch=('any')
url="https://github.com/open-source-uom/unidesk"
license=('GPL-3.0-or-later')
depends=(
    'hicolor-icon-theme'
    'python'
    'python-pyqt6'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
provides=("${_pkgname}")
conflicts=(${_pkgname})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "resources/unidesk.desktop" \
        "$pkgdir/usr/share/applications/unidesk.desktop"

    if [ -f "resources/unios.png" ]; then
        install -Dm644 "resources/unios.png" \
            "$pkgdir/usr/share/pixmaps/unidesk.png"
        install -Dm644 "resources/unios.png" \
            "$pkgdir/usr/share/icons/hicolor/128x128/apps/unidesk.png"
    else
        echo "==> WARNING: resources/unios.png not found"
        sed -i 's/^Icon=unidesk$/Icon=system-help/' \
            "$pkgdir/usr/share/applications/unidesk.desktop"
    fi

    install -Dm644 "$pkgdir/usr/share/applications/unidesk.desktop" \
        "$pkgdir/etc/xdg/autostart/unidesk.desktop"
}
