# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SDV
pkgname=python-${_base,,}
pkgver=1.8.0
pkgrel=1
pkgdesc="Generate synthetic data for single table, multi table and sequential data"
arch=(x86_64)
url="https://github.com/${_base,,}-dev/${_base}"
license=('custom')
depends=(python-graphviz python-copulas python-ctgan python-deepecho python-rdt
  python-sdmetrics python-cloudpickle python-boto3 python-botocore)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('399ec9cba3c997431c19a67874513d288a67ef747a6a04632e4fb65aec375671aeadd7fb9120930f676b1608fa7b7144c2a77257d005bdb02018fb4711bff913')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
