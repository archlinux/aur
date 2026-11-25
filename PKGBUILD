# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slack-export-viewer
pkgver=4.0.4
pkgrel=1
pkgdesc="A Slack Export archive viewer"
arch=(any)
url=https://github.com/hfaran/slack-export-viewer
license=(MIT)
depends=(
    python-click
    python-emoji
    python-flask
    python-frozen-flask
    python-markdown2
    python-werkzeug
)
makedepends=(
    python-build
    python-installer
    python-poetry-core
)
optdepends=('python-frozen-flask: support static HTML output')
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/hfaran/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('16556b6cbb74aff2d0c72e092658521367ee7587ef78244ec8f06eca1e44725841e9a29dd63e8797e58e87a49e97b0bb421efab21041cc348b6c338e535bf029')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname-$pkgver
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    python -m installer --destdir=../test_dir dist/*.whl
    rm -rf slackviewer
    PYTHONPATH="$PWD"/../test_dir/$_site_packages pytest
}

check() {
    cd $pkgname-$pkgver
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf slackviewer
    test-env/bin/python -P -m pytest -o addopts="" --ignore=tests/test_release.py
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
 
