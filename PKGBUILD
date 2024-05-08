# Maintainer: Brody <archfan at brodix dot de>

_pyname=google-cloud-bigquery
pkgname=python-google-cloud-bigquery
pkgver=3.22.0
pkgrel=1
pkgdesc='Google BigQuery API client library'
arch=(any)
url=https://github.com/googleapis/python-bigquery
license=(Apache)
depends=(
  python-dateutil
  python-google-api-core
  python-google-cloud-bigquery-storage
  python-google-cloud-core
  python-google-resumable-media
  python-grpcio
  python-packaging
  python-protobuf
  python-pyarrow
  python-requests
)
makedepends=(
  ipython
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  ipython
  'python-fastparquet: fastparquet support'
  'python-llvmlite: fastparquet support'
  'python-pandas: pandas support'
  'python-snappy: fastparquet support'
  'python-tqdm: tqdm support'
)
changelog=CHANGELOG.md
# source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
source=(${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz)
b2sums=(b161f73adfaa1188515378bcd77a4fc1b3a4b7702eb8533459834b7c9494dc020666fded34e68ef2ed7a96b53404813ea3f7c08a2d8bc6c99b84f75101907403)

build() {
  cd ${_pyname}-${pkgver}
  python -m build \
    --wheel \
    --no-isolation
  # PYTHONPATH="${PWD}" sphinx-build -b man docs/ _build
}

package() {
  local _site=$(python -c 'import site; print(site.getsitepackages()[0])')

  cd ${_pyname}-${pkgver}
  python -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl
  install -Dm644 README.rst -t "${pkgdir}"/usr/share/doc/${pkgname}
  # install -Dm644 docs/_build/google-cloud-bigquery.1 -t "${pkgdir}"/usr/share/man/man1
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -s \
    ${_site}/google_cloud_bigquery-${pkgver}.dist-info/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
