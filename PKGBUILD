# Maintainer: Brody <archfan at brodix dot de>

pkgname=python-google-cloud-storage
pkgver=3.13.0
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=(any)
_pkgname=${pkgname#python-}
_reponame=google-cloud-python
url=https://github.com/googleapis/${_reponame}/tree/${_pkgname}-v${pkgver}/packages/${_pkgname}
license=(Apache-2.0)
depends=(
  python
  python-google-api-core
  python-google-auth
  python-google-cloud-core
  python-google-crc32c
  python-google-resumable-media
  python-requests
)
optdepends=(python-protobuf)
makedepends=(
  python-build
  python-cryptography
  python-installer
  python-recommonmark
  python-setuptools
  python-sphinx
  python-wheel
)
#checkdepends=(
#  python-grpcio
#  python-google-cloud-iam
#  python-google-cloud-kms
#  python-google-cloud-testutils
#  python-grpc-google-iam-v1
#  python-mock
#  python-psutil
#  python-pytest
#  python-pyyaml
#)
source=(${pkgname}-${pkgver}.tar.gz::${url/tree*}/archive/${_pkgname}-v${pkgver}.tar.gz)
b2sums=('9a5f4419625ec0ed7359cda0be96002d9e4107469b1ac94cf75070bfa77cd9612b3cb6764e8ab6846c6d881686aca3d108aa370976697d7908669683bf57117e')

build() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

  python \
    -m build \
    --wheel \
    --no-isolation

  PYTHONPATH="${PWD}" sphinx-build -b man docs/ docs/build
}

## tests require set environment variables
#check() {
#  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}
#
#  python -m pytest
#}

package() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

  python \
    -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    {CHANGELOG.md,README.rst}

  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 \
    docs/build/google-cloud-storage.1

  local _site_packages
  _site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -sr -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    "${pkgdir}"${_site_packages}/${_pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE
}

# vim: ts=2 sw=2 et:
