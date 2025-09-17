# Maintainer: Brody <archfan at brodix dot de>

_reponame=google-cloud-python
_pkgname=google-cloud-bigquery-storage
pkgname=python-google-cloud-bigquery-storage
pkgver=2.33.1
pkgrel=1
pkgdesc='BigQuery Storage API client library'
arch=(any)
url=https://github.com/googleapis/${_reponame}
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
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${_pkgname}-v${pkgver}.tar.gz)
b2sums=('c3bb7f04906a7fcb3628fdf6ecd277a3fba6d9cd00fe8df781ea4c12a22919ad3a10a67e728fe7a93fc4b123def4799a21542a15929da25d8d5efc5ebc2bfae5')

build() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

  python -m build \
    --wheel \
    --no-isolation

  (
    cd docs

    PYTHONPATH=../ sphinx-build -b man ./ _build
  )
}

## FIXME: test plugins conflict
# check() {
#   cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}
#
#   PYTHONPATH="{$PWD}" pytest -x --disable-warnings
# }

package() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

  python -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    README.rst

  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 \
    docs/_build/${_pkgname}.1

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}

  local _site_packages
  _site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
  ln -sr -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    "${pkgdir}"/${_site_packages}/${_pkgname/-/_}-${pkgver}.dist-info/LICENSE
}

# vim: ts=2 sw=2 et:
