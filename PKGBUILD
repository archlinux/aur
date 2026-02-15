# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_bigquery
pkgname=python-google-cloud-bigquery
pkgver=3.40.1
pkgrel=1
pkgdesc='Google BigQuery API client library'
arch=(any)
url=https://github.com/googleapis/python-bigquery
_phurl=https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}
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
# source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
source=(${pkgname}-${pkgver}.tar.gz::${_phurl}/${_pyname}-${pkgver}.tar.gz)
b2sums=('cf8db6b2470a61c687ea755132c5aaf9993c3648597ef58fa80c2a87c7fad43e22ed12ef2a4126dfd19b7786dfc1478792bf9fcd067154fbd0c5a1d887e63de1')

build() {
  cd ${_pyname}-${pkgver}

  python -m build \
    --wheel \
    --no-isolation

  # PYTHONPATH="${PWD}" sphinx-build -b man docs/ _build
}

package() {
  cd ${_pyname}-${pkgver}

  python -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    README.rst

  # install -Dm644 -t "${pkgdir}"/usr/share/man/man1 \
  #   docs/_build/google-cloud-bigquery.1

  local _site_packages
  _site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -sr -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    "${pkgdir}"${_site_packages}/${_pyname}-${pkgver}.dist-info/LICENSE
}

# vim: ts=2 sw=2 et:
