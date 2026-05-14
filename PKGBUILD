# Maintainer: Brody <archfan at brodix dot de>

_reponame=google-cloud-python
pkgname=python-google-cloud-bigquery-storage
_pkgname=${pkgname##python-}
pkgver=2.38.0
pkgrel=1
pkgdesc='BigQuery Storage API client library'
arch=(any)
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
source=(${pkgname}-${pkgver}.tar.gz::${url%/tree*}/archive/${_pkgname}-v${pkgver}.tar.gz)
b2sums=('c3b955ef3004333331899634d20ad436a368f0e9ca3b516464eefea6038f8c0cf92e7f84b12ae8fd09f4a7ae84d6118ae335386629c2385e0ed85cd41426a372')

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

  local _site_packages
  _site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -sr -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    "${pkgdir}"/${_site_packages}/${_pkgname/-/_}-${pkgver}.dist-info/LICENSE
}

# vim: ts=2 sw=2 et:
