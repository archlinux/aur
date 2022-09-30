# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=3.1.0
pkgrel=1
pkgdesc='Library for producing CycloneDX SBOM (Software Bill of Materials) files'
arch=('any')
url='https://github.com/CycloneDX/cyclonedx-python-lib'
license=('Apache')
depends=('python-packageurl' 'python-sortedcontainers')
checkdepends=(
  'python-ddt'
  'python-jsonschema'
  'python-lxml'
  'python-setuptools'
  'python-toml'
  'xmldiff'
)
makedepends=('git' 'python-installer' 'python-poetry')
conflicts=('python-cyclonedx-lib-git')
options=('!strip')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/CycloneDX/cyclonedx-python-lib/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7fb4e9a94e70837304426d3574a60bee9431fade2c2ebfa348571575769233455ef129f82019c54a57cff324421ab146639a1bdd2f5777ccb18a56322441674d')

prepare() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  rm -rf dist # https://github.com/python-poetry/poetry/issues/1329

  # Temporary workaround in order to prevent poetry from building an
  # empty wheel. Remove this workaround as soon as the upstream fix
  # lands in the community/python-poetry package.
  #
  # See also: https://github.com/python-poetry/poetry/issues/5547
  git -c init.defaultBranch=master init
}

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  poetry build --format wheel
}

check() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m venv --clear --system-site-packages \
    .venv
  # shellcheck disable=SC1091
  source .venv/bin/activate
  pip install --force-reinstall dist/*.whl
  python -m unittest discover -s tests -v
  deactivate
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
