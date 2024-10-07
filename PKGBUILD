# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_bigquery
pkgname=python-google-cloud-bigquery
pkgver=3.26.0
pkgrel=1
pkgdesc='Google BigQuery API client library'
arch=(any)
url=https://github.com/googleapis/python-bigquery
license=(Apache-2.0)
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
b2sums=(dfd0d064cafae9a2262ac1a2cb461fc8dc0ba5a1d19c63e25e436c4436bd6b79d08c3d0b614d6b8e665a4f63c18dec8dfc4117aeaa92228420da317e432dcbe4)

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
  
  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} README.rst
  # install -Dm644 docs/_build/google-cloud-bigquery.1 -t "${pkgdir}"/usr/share/man/man1
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -sr -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    "${pkgdir}"${_site}/google_cloud_bigquery-${pkgver}.dist-info/LICENSE
}

# vim: ts=2 sw=2 et:
