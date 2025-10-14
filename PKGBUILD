# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_name=ydata-profiling
pkgname=python-ydata-profiling
pkgver=4.17.0
pkgrel=3
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
b2sums=('f6c9ec97bb51035d65c102f68b29abfe7a177aee176fe65d2f6bfa89690b09ad9f82f7905bad01b4e77b56cc8d3e7a37cf43aec8bfbd547fb10f1e120c9e02c0')

prepare() {
  # fix version fallback (the git snapshot does not contain the VERSION file)
  sed -i 's|version = "0.0.dev0"|version = "'$pkgver'"|' $_name-$pkgver/setup.py

  # drop version constraints for setuptools
  sed -i 's|"setuptools>=72.0.0,<80.0.0"|"setuptools"|' $_name-$pkgver/pyproject.toml
  sed -i 's|"setuptools-scm>=8.0.0,<9.0.0"|"setuptools-scm"|' $_name-$pkgver/pyproject.toml

  # disable ydata-sdk advertisement
  # https://github.com/ydataai/ydata-profiling/blob/develop/src/ydata_profiling/utils/information.py
  sed -i 's|^SUPPRESS_BANNER = .*|SUPPRESS_BANNER = True|' $_name-$pkgver/src/ydata_profiling/utils/information.py
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
