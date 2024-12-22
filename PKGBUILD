# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pypipe
pkgver=0.4.1
pkgrel=3
pkgdesc='Python command-line tool for pipeline processing'
arch=('any')
url='https://github.com/bugen/pypipe'
license=('Apache-2.0')
depends=('bash' 'python')
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bugen/pypipe/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '6786d4d7358036706c2a9179fc33f4b5df67d15d245055eca052711b05f82e7927764281c78450a2ef2ad91b2fb6eb25dc3a611b6ad0b0a875928a1562b83e03'
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
