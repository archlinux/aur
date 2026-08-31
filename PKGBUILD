# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mnelab
_name=${pkgname#python-}
pkgver=1.5.7
pkgrel=1
pkgdesc="Graphical user interface (GUI) for MNE, a Python package for EEG/MEG analysis"
arch=('any')
url="https://github.com/cbrnr/mnelab"
license=('BSD-3-Clause')
depends=(
    'pyside6'
    'python'
    'python-autoreject'
    'python-black'
    'python-isort'
    'python-matplotlib'
    'python-mne'
    'python-mne-qt-browser'
    'python-numpy'
    'python-picard'
    'python-pybvrf'
    'python-pyxdf'
    'python-scikit-learn'
    'python-scipy'
    'qt6-svg'
)
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=(
    "https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
    "mnelab.desktop"
    "mnelab-mimetypes.xml"
)
sha256sums=('ac5e3055b9e1137864556ca2e433ff38298d77078c3ec6db678af2556be38767'
            '90465ed1dcd28013a24a9410d9ea7529e9a94e58325d54d57dacf7c0552ec3ae'
            '566cccf86be39eed374a3cfa3905945c9aa60e553b73c4758c2c66d46184c977')

prepare() {
    cd "$srcdir/$_name-$pkgver"
    # Relax uv_build version constraint to allow Arch's current version
    sed -i -E 's/(uv_build\s*>=?\s*0\.10\.9,\s*<\s*)0\.11\.0/\10.12.0/' pyproject.toml
}

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "$srcdir/mnelab.desktop" "$pkgdir/usr/share/applications/mnelab.desktop"

    install -Dm644 "$srcdir/mnelab-mimetypes.xml" "$pkgdir/usr/share/mime/packages/mnelab.xml"

    install -Dm644 "src/mnelab/icons/mnelab-logo.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/mnelab.svg"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
