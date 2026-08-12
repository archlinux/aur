# Maintainer: Brody <archfan at brodix dot de>

pkgname=python-google-cloud-core
pkgver=2.6.1
pkgrel=1
pkgdesc='Google Cloud API client core library'
_pkgname=${pkgname#python-}
_reponame=google-cloud-python
url=https://github.com/googleapis/${_reponame}/tree/${_pkgname}-v${pkgver}/packages/${_pkgname}
arch=(any)
license=(Apache-2.0)
depends=(
  python
  python-google-api-core
  python-google-auth
)
makedepends=(
  git
  python-build
  python-cryptography
  python-installer
  python-recommonmark
  python-setuptools
  python-sphinx
  python-wheel
)
optdepends=('python-grpcio: for grpc support')
source=(${_reponame}::git+${url%/tree*}.git#tag=${_pkgname}-v${pkgver})
b2sums=('9ac5bd4918b5b6bf5e82ac8bd7b836a159014f74d4a54d4eeade455756875a2d6a54fc445110d1a2320fd068d3161632db9968439dac94e043c143ffb83e401c')

build() {
  cd ${_reponame}/packages/${_pkgname}

  python -m build \
    --wheel \
    --no-isolation

  PYTHONPATH="${PWD}" sphinx-build -b man docs/ _build
}

package() {
  cd ${_reponame}/packages/${_pkgname}

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
    "${pkgdir}"${_site_packages}/${_pkgname//-/_}-${pkgver}.dist-info/licenses/LICENSE
}

# vim: ts=2 sw=2 et:
