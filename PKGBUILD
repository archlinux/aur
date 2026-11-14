# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pytest-rng
_name=pytest-rng
pkgver=1.0.0
pkgrel=1
pkgdesc='Pytest fixtures for seeding tests and making randomness reproducible'
arch=('any')
url='https://github.com/nengo/pytest-rng'
license=('MIT')
depends=('python' 'python-numpy' 'python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('91cf52a53cac5b20c0495d1b8a1544f1c88b39b587c26cf2e6af9849e27c5c5f')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    local site
    site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    rm -rf "$srcdir/check-root" "$srcdir/check-cache"
    cd "$_name-$pkgver"
    python -m installer --destdir="$srcdir/check-root" dist/*.whl
    # Run the upstream suite from the staged wheel with upstream's pytest
    # settings. The pytester runs load the plugin through its entry point.
    cd "$srcdir/check-root$site"
    PYTHONPATH="$PWD" python -P -m pytest -p pytester -ra \
        --rootdir="$PWD" -o cache_dir="$srcdir/check-cache" \
        -o python_files=test_pytest.py -o pytester_example_dir=pytest_rng/tests \
        -W 'ignore:testdir.copy_example is an experimental api' \
        pytest_rng/tests
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
