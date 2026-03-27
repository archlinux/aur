# Maintainer: Brody <archfan at brodix dot de>

_reponame=google-cloud-python
pkgname=python-google-cloud-bigquery
_pkgname=${pkgname##*python-}
pkgver=3.41.0
pkgrel=1
pkgdesc='Google BigQuery API client library'
arch=(any)
url=https://github.com/googleapis/${_reponame}/tree/${_pkgname}-v${pkgver}/packages/${_pkgname}
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
source=(${pkgname}-${pkgver}.tar.gz::${url%/tree*}/archive/${_pkgname}-v${pkgver}.tar.gz)
b2sums=('f4b7a888232847e1ce167ba5823df674779dcc9a686683434706731f7ff5745e8bf33ce71ee374b94f35a9cc274464cb07673688d91c8a3f0b424b4fba73458a')

build() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

  python -m build \
    --wheel \
    --no-isolation

  # PYTHONPATH="${PWD}" sphinx-build -b man docs/ _build
}

package() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

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
