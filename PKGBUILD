# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sphinx-last-updated-by-git
pkgname=python-${_base}
pkgver=0.3.5
pkgrel=1
pkgdesc="Get the last updated time for each Sphinx page from Git"
arch=(any)
url="https://github.com/mgeier/${_base}"
license=('custom:BSD-2-clause')
depends=(python-sphinx git)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b8fa97eaa1b732a8417850c2a18efadf66b3e3967e5c0ce9baa6e518fe8751b847cdf3299368bb4070030050cc2bd349d4e583cd013907fbe95bac726a189617')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=tests/test_example_repo.py --ignore=tests/test_singlehtml.py -k 'not untracked_source_files'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
