# Maintainer: Brody <archfan at brodix dot de>

pkgname=python-google-cloud-storage
pkgver=3.15.0
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
source=(${pkgname}-${pkgver}.tar.gz::${url%/tree*}/archive/${_pkgname}-v${pkgver}.tar.gz)
b2sums=('29b39b47a1ec938b7db7fc7b1fa3c1be0b5c7d873dcce07c00b6988e86ed621e1477a33f386b0186d415785c1ec043aa678ace0bbb37592a790c663ed5a17b1c')

build() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

  python -m build \
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

  python -m installer \
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
