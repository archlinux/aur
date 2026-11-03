# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=labelassister
pkgver=2026.11.03.0
pkgrel=1
pkgdesc="Label editor for Brother QL-700 and QL-800 series"
arch=('any')
url="https://git.sciunto.org/PublicTools/LabelAssister"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'python-pillow' 'python-pymupdf' 'python-pyusb' 'python-brother_ql')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("labelassister-v${pkgver}.tar.gz::https://git.sciunto.org/PublicTools/LabelAssister/archive/${pkgver}.tar.gz")
sha256sums=('8a42a02de415df6a29fe3dad7f2280f1e6f102dfccd49bb2de9f01624485a239')

build() {
    cd "$srcdir/labelassister"
    rm -rf dist
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/labelassister"
    python -m installer --destdir="$pkgdir" dist/*.whl

    local purelib
    purelib="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

    mkdir -p "$pkgdir/$purelib/resources/translations"
    install -m644 resources/translations/*.qm "$pkgdir/$purelib/resources/translations/"
    mkdir -p "$pkgdir/$purelib/resources/icons"
    install -m644 resources/icons/*.svg "$pkgdir/$purelib/resources/icons/"
    install -Dm644 resources/udev/60-brother-ql.rules "$pkgdir/usr/lib/udev/rules.d/60-brother-ql.rules"
    install -Dm644 resources/labelassister.desktop "$pkgdir/usr/share/applications/labelassister.desktop"
    install -Dm644 resources/labelassister.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/labelassister.svg"
}
