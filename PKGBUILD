# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=2.7.1
pkgrel=1
pkgdesc='Library for producing CycloneDX SBOM (Software Bill of Materials) files'
arch=('any')
url='https://github.com/CycloneDX/cyclonedx-python-lib'
license=('Apache')
depends=('python-packageurl' 'python-setuptools' 'python-importlib-metadata' 'python-sortedcontainers' 'python-toml')
makedepends=('git' 'python-installer' 'python-poetry')
conflicts=('python-cyclonedx-lib-git')
options=('!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/CycloneDX/cyclonedx-python-lib/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ffdc136049d351b719fc49187d531a5595cc62744f41277bcba16e342aa872321ecf0c78ff7aa3a105eaf4b24d49ac31ffd3d5db64c2a5b795264f60776ebe49')

prepare() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  rm -rf dist # https://github.com/python-poetry/poetry/issues/1329

  # Temporary workaround in order to prevent poetry from building an
  # empty wheel. Remove this workaround as soon as the upstream fix
  # lands in the community/python-poetry package.
  #
  # See also: https://github.com/python-poetry/poetry/issues/5547
  git init
}

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  poetry build --format wheel
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -X pycache_prefix=pycache -m installer --destdir="${pkgdir}" dist/*.whl
  rm -rf pycache
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
