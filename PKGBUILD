# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slack-export-viewer
pkgver=4.0.0
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
b2sums=('79b0413cf137463a1c247c11c23518bef3137fad3a68da89c3ccc732cfe3d61f2abd3d8cf422e4fa8ea7e0f1e71d6d053c712811d89bc5fdb173920ef18a8c48')

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

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
 
