# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

_name=stamina
pkgname=python-stamina
pkgver=25.1.0
pkgrel=1
pkgdesc="Production-grade retries for Python"
arch=('any')
url="https://github.com/hynek/stamina"
license=('MIT')
depends=('python-tenacity')
makedepends=(
    'python-build'
    'python-hatchling'
    'python-hatch-fancy-pypi-readme'
    'python-hatch-vcs'
    'python-installer'
    'python-wheel')
checkdepends=('python-pytest' 'python-anyio' 'python-dirty-equals')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('63d4deccdf17ac586d6c8c4fdaece98c8ec358f44390e9a87c7695835554af48')

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    echo ":: Tests require a local installation; using a venv instead"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest
    echo ":: Removing test-env"
    rm -rf test-env
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
