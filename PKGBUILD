# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SDV
pkgname=python-${_base,,}
pkgver=1.10.0
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
sha512sums=('a4de8050be09652ed21a7d9bf06e412ddf67fd50a5671f9f9cc24355bf23dea2bbb13f4dd02c6eaaced0f119b3fec94249c166619095db81612a26573bf88467')

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
