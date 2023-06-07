# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slack-export-viewer
pkgver=1.1.5
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
b2sums=('321c995e9c65cef3515492ac7f2f882d128e5f49ee1ea0feb6719ad81b2538d44c696359937b2ce95309581d1a0a26bb2caaef7c6e759b21d3fa665af9e6ef2a')

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
 
