# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-rachis
pkgver=2026.10.0
pkgrel=1
pkgdesc='Extensible scientific analysis framework formerly known as QIIME 2'
arch=(any)
url=https://github.com/rachis-org/rachis
license=(BSD-3-Clause)
depends=('python' 'python-bibtexparser1' 'python-dill' 'python-flufl-lock' 'python-networkx' 'python-numpy' 'python-pandas' 'python-parsl>=2026.0' 'python-platformdirs' 'python-psutil' 'python-dateutil' 'python-yaml' 'python-setuptools' 'python-tomlkit' 'python-tzlocal' 'python-lxml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
checkdepends=('python-pytest' 'python-tornado' 'jupyter-notebook')
_commit=4c768c7aba1db4aa69ac2734a6dcfbb3b5ebf1ca
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        'moving-pictures-metadata.tsv::https://data.qiime2.org/2022.11/tutorials/moving-pictures/sample_metadata.tsv'
        'qiime2-docs-2024.10.html::https://docs.qiime2.org/2024.10/'
        offline_usage_tests.py)
sha256sums=('600400937f074aa36ff75bef34318424d5e6afa06352d13c18cf5b35f8740f98'
            '9dbfbedd90776d77c431faa914d81b0d6299fff10c364216dbcd5c6df5382cc9'
            '35cdebbbee8effb16b4d7eaf53ad3d5405e2e81516fdce5bbf074653304e8a7e'
            '6d28a0a61f4250c4908a2bcbaac8c2c014e335c3f965a0acf21873b44c232598')
optdepends=('python-matplotlib: graph visualization' 'python-pytest: run the shipped framework test suite')
build() {
  cd "rachis-$_commit"
  python -m build --wheel --no-isolation
}

check() {
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
