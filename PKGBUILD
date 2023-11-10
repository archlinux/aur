# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pypipe
pkgver=0.3.1
pkgrel=1
pkgdesc='Python command-line tool for pipeline processing'
arch=('any')
url='https://github.com/bugen/pypipe'
license=('Apache')
depends=('python')
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bugen/pypipe/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '7bf7a2f60b1a65d7f055cb2cec23f77b7c9b4c11692d331f3dda710d3058f796d06f3ea42e1573fec99225ff6667b9d93c253aa21f71b4f9d6713c8c82e6353e'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m pytest -v tests/
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Packaging script'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging examples'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples" docs/*

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
