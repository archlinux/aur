# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slack-export-viewer
pkgver=1.4.1
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
optdepends=('python-frozen-flask: support static HTML output')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hfaran/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('26b96bd1ae49e631baf83de285e4462e46add73d0e357580f764e2c10b7af1165c1e406838041f6156114f9b914c6bb9d930205701281c78ef02619ea29bf868')

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
 
