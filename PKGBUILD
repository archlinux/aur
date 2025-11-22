# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_name=ydata-profiling
pkgname=python-ydata-profiling
pkgver=4.18.0
pkgrel=1
pkgdesc='Create HTML profiling reports from pandas DataFrame objects'
arch=(any)
url='https://github.com/ydataai/ydata-profiling'
license=(MIT)
depends=(
  ipython
  python
  python-dacite
  python-dateutil
  python-filetype
  python-minify-html
  python-imagehash
  python-ipywidgets
  python-jinja
  python-matplotlib
  python-markupsafe
  python-multimethod
  python-networkx
  python-numba
  python-numpy
  python-packaging
  python-pandas
  python-phik
  python-pillow
  python-pydantic
  python-requests
  python-seaborn
  python-scipy
  python-statsmodels
  python-tqdm
  python-typeguard
  python-visions
  python-wordcloud
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pyarrow
  python-pytest
  python-pytest-xdist
)
optdepends=(
  'python-tangled-up-in-unicode: support for more detailed Unicode analysis, at the expense of additional disk space'
)
conflicts=(python-pandas-profiling)
replaces=(python-pandas-profiling)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('96b87b32f1edab5c70529ce15bd4b7e12f36640f4646160e4c82ce2f273c249974ff41a488c344c0720091e79b2d6eb81867e7fe890063290bc5e01f8ec503f1')

prepare() {
  # fix version fallback (the git snapshot does not contain the VERSION file)
  sed -i 's|version = "0.0.dev0"|version = "'$pkgver'"|' $_name-$pkgver/setup.py

  # drop version constraints for setuptools
  sed -i 's|"setuptools>=72.0.0,<80.0.0"|"setuptools"|' $_name-$pkgver/pyproject.toml
  sed -i 's|"setuptools-scm>=8.0.0,<9.0.0"|"setuptools-scm"|' $_name-$pkgver/pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -W ignore::DeprecationWarning
    # skip hanging test
    --deselect tests/unit/test_console.py
    # ModuleNotFoundError: No module named 'scipy.stats._mvn'
    --deselect tests/unit/test_correlations.py::test_compare_report_with_correlation_table
    --deselect tests/unit/test_correlations.py::test_compare_report_without_correlation_table
    --deselect tests/unit/test_correlations.py::test_standard_report_with_correlation_table
    --deselect tests/unit/test_correlations.py::test_standard_report_without_correlation_table
    --deselect tests/unit/test_modular.py::test_modular_present
    # Connection to data.nasa.gov timed out. (connect timeout=None)
    --deselect tests/unit/test_example.py::test_example
  )

  cd $_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests/unit
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
