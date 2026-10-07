# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=python-cyclonedx-lib
_gitpkgname=cyclonedx-python-lib
pkgver=11.12.0
pkgrel=1
pkgdesc='Render and read CycloneDX, a lightweight BOM specification document format'
arch=('any')
url='https://github.com/CycloneDX/cyclonedx-python-lib'
license=('Apache-2.0')
depends=(
  'python'
  'python-idna'  # for the `idn-email` format used in CycloneDX schemas
  'python-jsonschema'
  'python-license-expression'
  'python-lxml'
  'python-packageurl'
  'python-py-serializable'
  'python-referencing'
  'python-rfc3339-validator'  # for the `date-time` format
  'python-rfc3986-validator'  # for the `uri` format
  'python-sortedcontainers'
  'python-typing_extensions'
)
checkdepends=(
  'python-ddt'
  'python-toml'
  'xmldiff'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
)
conflicts=('python-cyclonedx-lib-git')
options=('!debug' '!strip')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/CycloneDX/cyclonedx-python-lib/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=('21c12da49bd8a8e9ddca91a589527a6038749214cbdf94668ac5eab69ab4693de35fad957c7aec1dbfaca83aed7f4399d41e4d76d6804c24640b4fdf7b83cf93')

prepare() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  rm -rf dist  # https://github.com/pypa/build/issues/455
}

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m unittest discover -v
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE NOTICE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
