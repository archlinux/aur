# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slack-export-viewer
pkgver=1.1.6
pkgrel=1
pkgdesc="A Slack Export archive viewer"
arch=('any')
url="https://github.com/hfaran/slack-export-viewer"
license=('MIT')
depends=(
    'python-click'
    'python-emoji'
    'python-flask'
    'python-markdown2'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hfaran/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('65999e41a26c66b9b0520f2235b636cca1e025c72d4f184f24e67edd11a2a6baa67ead4de54420fe93241f18406aca17f6acd8cbdb8057d349d5066c24743cc9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$srcdir/test" dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="$srcdir"/test/usr/lib/python${python_version}/site-packages
    python -m pytest tests/
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
 
