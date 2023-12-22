# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slack-export-viewer
pkgver=1.3.0
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
b2sums=('9e52713a53b8eca27b167b2dc5346f43a7423e73acd526c5ff95c67a743054bd7dfcd3bced5ceb36b97d6b3879416bc65f942d1681577de8fa5c68a0fa650de4')

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
 
