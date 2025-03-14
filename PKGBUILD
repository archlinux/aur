# Maintainer: Brody <archfan at brodix dot de>

_pkgname=python-bigquery-storage
pkgname=python-google-cloud-bigquery-storage
pkgver=2.29.1
pkgrel=1
pkgdesc='BigQuery Storage API client library'
arch=(any)
url=https://github.com/googleapis/python-bigquery-storage
license=(Apache-2.0)
depends=(
  python-google-api-core
  python-grpcio
  python-proto-plus
  python-protobuf
)
makedepends=(
  python-build
  python-installer
  python-recommonmark
  python-setuptools
  python-sphinx
  python-wheel
)
optdepends=(
  'python-arrow: pyarrow support'
  'python-fastavro: fastavro support'
  'python-pandas: pandas support'
)
# checkdepends=(
#   python-freezegun
#   python-google-cloud-bigquery
#   python-google-cloud-testutils
#   python-pytest
# )
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('661c6bf50e970f5c087b2e5fbc7bb756fb6c7f89bcabc5662c9ec036a8170dd14f1c3751268ee5af9c6dc53dff9575027b37e671671f13193887b79f5f9bbf3e')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build \
    --wheel \
    --no-isolation

  cd docs
  PYTHONPATH=../ sphinx-build -b man ./ _build
}

## FIXME: test plugins conflict
# check() {
#   cd ${_pkgname}-${pkgver}
#   PYTHONPATH="{$PWD}" pytest -x --disable-warnings
# }

package() {
  local _site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')

  cd ${_pkgname}-${pkgver}
  python -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    README.rst

  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 \
    docs/_build/google-cloud-bigquery-storage.1

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}

  ln -sr -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    "${pkgdir}"/${_site_packages}/google_cloud_bigquery_storage-${pkgver}.dist-info/LICENSE
}

# vim: ts=2 sw=2 et:
