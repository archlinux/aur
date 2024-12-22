# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=itchcraft
pkgver=0.4.1
pkgrel=2
pkgdesc='Tech demo for interfacing with heat-based USB insect bite healers'
arch=('any')
url='https://github.com/claui/itchcraft'
license=('Apache-2.0')
depends=(
  'python'
  'python-colorama'
  'python-fire'
  'python-pyusb'
  'python-tenacity'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-myst-parser'
  'python-poetry-core'
  'python-sphinx'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-pytest-mock')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/claui/itchcraft/archive/v${pkgver}.tar.gz")
sha512sums=('5cbb90510ffd61b589e7d7f585e675508cea96dd438f36192f41d98b2cd3777c5b7b9c49d97d0552185acaaa4c9f562eb7acdc63cc22df69d9f396d97580bc9a')

build() {
  cd "${pkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating man page'
  sphinx-build -aqEW -b man doc/sphinx build/man
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging udev rules'
  install -D -m 644 -t "${pkgdir}/usr/lib/udev/rules.d" \
    contrib/udev/*.rules

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE

  echo >&2 'Packaging the man page'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man1" \
    build/man/*.1
}
