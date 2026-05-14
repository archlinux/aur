# Maintainer: mescon <mescon@gmail.com>
pkgname=redx
pkgver=0.1.0
pkgrel=1
pkgdesc='Find and delete empty directories: Linux port of RED'
arch=('any')
url='https://github.com/mescon/redx'
license=('LGPL-3.0-or-later')
depends=(
    'python'
    'pyside6'
    'python-send2trash'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
    'python-pytest'      # check() runs the test suite at build time
    'python-pytest-qt'   # tests/test_filters_tab.py uses the qtbot fixture
)
# AUR submission flow:
#   1. Tag the release in the project repo:
#        git tag v$pkgver && git push origin v$pkgver
#   2. Regenerate sha256sums by running, in this directory:
#        makepkg -g >> PKGBUILD     # then remove the placeholder line
#   3. Test locally with `makepkg -si`, then submit to AUR.
#
# For dev builds against an untagged local checkout, override the
# source on the command line, e.g.:
#   makepkg -si SRCDEST=. \
#     source=("$pkgname-$pkgver::git+file://$(realpath ..)")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('98ee5f5ea1f6ebf44fe46a5dccb0ed69785ed6cc14311bc6bc1081cdf9827ddd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    QT_QPA_PLATFORM=offscreen python -m pytest -q
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 packaging/redx.desktop \
        "$pkgdir/usr/share/applications/redx.desktop"
    install -Dm644 redx/resources/redx.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/redx.svg"
    # Also drop the SVG into /usr/share/pixmaps. This is the legacy XDG
    # icon fallback that doesn't require gtk-update-icon-cache indexing,
    # which on its own happily ignores SVGs in scalable/apps/ and
    # leaves gnome-shell on Wayland with a generic-icon fallback.
    install -Dm644 redx/resources/redx.svg \
        "$pkgdir/usr/share/pixmaps/redx.svg"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
