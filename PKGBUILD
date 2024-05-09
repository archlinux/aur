# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slack-export-viewer
pkgver=1.4.3
pkgrel=1
pkgdesc="A Slack Export archive viewer"
arch=(any)
url=https://github.com/hfaran/slack-export-viewer
license=(MIT)
depends=(
    python-click
    python-emoji
    python-flask
    python-markdown2
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
optdepends=('python-frozen-flask: support static HTML output')
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/hfaran/$pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('93cc844c111c5aa1559860d0dc3ea7675e195c07c1f9a6978c7edf03db9803f85a165db636d08f5aa20b51211531aa3249faf64941b01ef2239d4d4f6fe97aeb')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname-$pkgver
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    python -m installer --destdir=../test_dir dist/*.whl
    PYTHONPATH=../test_dir/$_site_packages pytest
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
 
