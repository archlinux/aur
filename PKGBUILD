# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slack-export-viewer
pkgver=1.1.4
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
    'python-setuptools-scm-git-archive'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hfaran/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('1f62287573e98c63a3c2dab9cd3c57aff9c036bcc72aab6a123023e2cb3027e47e3fe80e25812c2d9c4bfa18081f186bcd7dd3ca873d6a00a944dbd477e853ca')

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
 
