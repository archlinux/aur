# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slack-export-viewer
pkgver=1.9.0
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
b2sums=('d152b88f9df8dd5c40141aebd480b293e404e0296081f2c4853e16fddd6901f3fbe716f557255a57ff515f0d294a1a93e2bfa4c4ca17c16ed142c93aed2cc591')

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
 
