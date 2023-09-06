# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=4.1.0
pkgrel=1
pkgdesc='Library for producing CycloneDX SBOM (Software Bill of Materials) files'
arch=('any')
url='https://github.com/CycloneDX/cyclonedx-python-lib'
license=('Apache')
depends=(
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
sha512sums=('5c1f478a11751ad4a9ea2d0133ca3f63914e1fe624d018443482ac9807a7a1b9415fea16a2461ccc6e74f801d148def0ff3a1c9f99b499a8efbcb9d2e2cd0744')

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
  python -m venv --clear --system-site-packages \
    .venv
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
