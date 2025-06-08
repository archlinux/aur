# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slack-export-viewer
pkgver=3.3.1
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
b2sums=('3d83c5e9f91cff45cbeee3abf52e9ded72639c9e350d417b7537ebff35858cb43e6a7588dcde951690b2ceb23891ea250b36656b452ecc5c82f47888ad9339c0')

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
 
