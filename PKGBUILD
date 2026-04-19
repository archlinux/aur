# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-single-source
pkgver=0.4.0
pkgrel=1
pkgdesc="Python library for accessing project versions"
arch=('any')
url="https://github.com/rabbit72/single-source"
license=('MIT')
depends=('python')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-toml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('99e98b8363fc723fbdff5d96494b0546242327afc0817ca30ea8750c8b9da34f')

build() {
    cd "single-source-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "single-source-$pkgver"
    pytest -x
}

package() {
    cd "single-source-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s \
        "$_site/single_source-$pkgver.dist-info/licenses/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/"

}
