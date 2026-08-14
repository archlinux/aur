# Maintainer: Brody <archfan at brodix dot de>

pkgname=python-google-cloud-bigquery-storage
pkgver=2.40.0
pkgrel=1
pkgdesc='BigQuery Storage API client library'
arch=(any)
_pkgname=${pkgname#python-}
_reponame=google-cloud-python
url=https://github.com/googleapis/${_reponame}/tree/${_pkgname}-v${pkgver}/packages/${_pkgname}
license=(Apache-2.0)
depends=(
  python-google-api-core
  python-grpcio
  python-proto-plus
  python-protobuf
)
makedepends=(
  python-build
  python-cryptography
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
#checkdepends=(
#  ipython
#  python-freezegun
#  python-google-cloud-bigquery
#  python-google-cloud-testutils
#  python-pandas
#  python-pytest
#)
source=(${pkgname}-${pkgver}.tar.gz::${url%/tree*}/archive/${_pkgname}-v${pkgver}.tar.gz)
b2sums=('d2f3636894ed2e14895e1d2819434da62255507432c3127a74c1d30f229042a0d9a48e41d282a623c727a0307bf28bfe91aa97e96407e04aef37abf9d48a3190')

build() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

  python -m build \
    --wheel \
    --no-isolation

  PYTHONPATH=${PWD} sphinx-build -b man docs/ _build
}

## FIXME: test plugins conflict
#check() {
#  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}
#
#  PYTHONPATH="${PWD}" \
#    python -m pytest \
#    -x \
#    --disable-warnings
#}

package() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

  python -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    {CHANGELOG.md,README.rst}

  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 \
    _build/${_pkgname}.1

  local _site_packages
  _site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -sr -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    "${pkgdir}"/${_site_packages}/${_pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE
}

# vim: ts=2 sw=2 et:
