# Maintainer: Brody <archfan at brodix dot de>

_pkgname=python-storage
pkgname=python-google-cloud-storage
pkgver=3.4.0
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=(any)
url=https://github.com/googleapis/python-storage
license=(Apache-2.0)
depends=(
  python-google-api-core
  python-google-auth
  python-google-cloud-core
  python-google-resumable-media
  python-requests
)
optdepends=(python-protobuf)
makedepends=(
  python-build
  python-installer
  python-recommonmark
  python-setuptools
  python-sphinx
  python-wheel
)
# checkdepends=(
#   python-google-cloud-testutils
#   python-mock
#   python-pytest-runner
#)
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('96036ed91a4170804539bfd5d5c02f964293f04f0c63986235eda3a102ed3631f6d1cb539a358e77db6c8043a47864626c332bac2e5c80cf65ebc167c3085cd5')

build() {
  cd ${_pkgname}-${pkgver}

  python \
    -m build \
    --wheel \
    --no-isolation

  PYTHONPATH="${PWD}" sphinx-build -b man docs/ docs/build
}

## tests require set environment variables
# check() {
#   cd ${_pkgname}-${pkgver}
#   python setup.py pytest
# }

package() {
  cd ${_pkgname}-${pkgver}

  python \
    -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    SECURITY.md

  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 \
    docs/build/google-cloud-storage.1
}

# vim: ts=2 sw=2 et:
