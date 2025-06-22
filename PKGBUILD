# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sphinx-last-updated-by-git
pkgname=python-${_base}
pkgver=0.3.8
pkgrel=1
pkgdesc="Get the last updated time for each Sphinx page from Git"
arch=(any)
url="https://github.com/mgeier/${_base}"
license=(BSD-2-Clause)
depends=(python-sphinx git)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('fba70cec6381c0eb910ff794c9b8c961444cf252293b0bb55d1483c85296f2751a453c858869da91c77d4e412b0c89ba1c11925647d08789e97c0483ea715e00')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_example_repo.py \
    --ignore=tests/test_singlehtml.py \
    -k 'not untracked_source_files'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
