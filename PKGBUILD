# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=4.2.3
pkgrel=1
pkgdesc='Library for producing CycloneDX SBOM (Software Bill of Materials) files'
arch=('any')
url='https://github.com/CycloneDX/cyclonedx-python-lib'
license=('Apache')
depends=(
  'python-license-expression'
  'python-packageurl'
  'python-py-serializable'
  'python-sortedcontainers'
)
checkdepends=(
  'python-ddt'
  'python-jsonschema'
  'python-lxml'
  'python-toml'
  'xmldiff'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
conflicts=('python-cyclonedx-lib-git')
options=('!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/CycloneDX/cyclonedx-python-lib/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0be8b1d6d6d785abcefe2397c326a76728013ce64e8156ec7db6abcfa023d0b067fae716afc7e0f1fd1c2b4981b49c791b94abf6b700cedcb80cdf545c1ca6cf')

prepare() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  rm -rf dist # https://github.com/python-poetry/poetry/issues/1329
}

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m venv --clear --system-site-packages .venv
  # shellcheck disable=SC1091
  source .venv/bin/activate
  pip install --force-reinstall dist/*.whl
  python -m unittest discover -v
  deactivate
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
