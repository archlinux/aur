# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-rachis
pkgver=2026.10.1
pkgrel=1
pkgdesc='Extensible scientific analysis framework formerly known as QIIME 2'
arch=(any)
url=https://github.com/rachis-org/rachis
license=(BSD-3-Clause)
depends=('python' 'python-bibtexparser1' 'python-dill' 'python-flufl-lock' 'python-networkx' 'python-numpy' 'python-pandas' 'python-parsl>=2026.0' 'python-platformdirs' 'python-psutil' 'python-dateutil' 'python-yaml' 'python-setuptools' 'python-tomlkit' 'python-tzlocal' 'python-lxml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
checkdepends=('python-pytest' 'python-tornado' 'jupyter-notebook')
_commit=7a34ccf0d3ea12df4604e805d2c12da3390609e2
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        'moving-pictures-metadata.tsv::https://data.qiime2.org/2022.11/tutorials/moving-pictures/sample_metadata.tsv'
        offline_usage_tests.py)
sha256sums=('c477b26c69bd44ea1740f8be70bab9199886a100f18ec489c4e2a3fdfaf50731'
            '9dbfbedd90776d77c431faa914d81b0d6299fff10c364216dbcd5c6df5382cc9'
            '8f2ecf9217aaac2342ae9823e138bd49c7798f9c6dc49443e7fb3b86f16e35e5')
optdepends=('python-matplotlib: graph visualization' 'python-pytest: run the shipped framework test suite')
build() {
  cd "rachis-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  # Use HTML from the pinned source for the invalid-metadata URL case.
  install -m644 "rachis-$_commit/src/rachis/plugin/tests/data/no_nan.html" \
    "$srcdir/invalid-metadata.html"
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "rachis-$_commit"/dist/*.whl
  # Keep the installed wheel isolated from the source tree and test-only plugin.
  local test_site
  test_site=$("$srcdir/check-env/bin/python" -I -c 'import site; print(site.getsitepackages()[0])')
  install -m644 "$srcdir/offline_usage_tests.py" "$test_site/aur_rachis_usage_fixtures.py"
  RACHIS_TEST_FIXTURES="$srcdir" QIIMETEST=1 MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I -m pytest --import-mode=importlib -p aur_rachis_usage_fixtures -v \
    "$test_site/rachis" --doctest-modules --junitxml="$srcdir/pytest-results.xml"
}

package() {
  cd "rachis-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
