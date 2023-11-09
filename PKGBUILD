# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pypipe
pkgver=0.3.0
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
  'f85836f7351f0264858059c1aa55d6dc7d645d320590257d3d2d816cbdeba1156138f00736432751ccce57d637341e1a8a95188d3bd3a2eeb957db93c99405e2'
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
