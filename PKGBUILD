# Maintainer: Antonios Rainakis <antonyrai26@gmail.com>
pkgname=uninews-git
_pkgname=UniNews
pkgver=0.2.1.r49.g98e5d6c
pkgrel=1
pkgdesc="University news from Greek and international universities in one place"
arch=('any')
url="https://github.com/open-source-uom/UniNews"
license=('GPL-3.0-or-later')
depends=(
    'hicolor-icon-theme'
    'python'
    'python-beautifulsoup4'
    'python-feedparser'
    'python-pyqt6'
    'python-requests'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    local _ver
    _ver=$(grep -m1 '^version' pyproject.toml | cut -d'"' -f2)
    printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}"
    PYTHONPATH="src" QT_QPA_PLATFORM=offscreen pytest -q
}

package() {
    cd "${_pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 packaging/uninews.desktop \
        "$pkgdir/usr/share/applications/uninews.desktop"
    install -Dm644 packaging/uninews.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/uninews.svg"
}
