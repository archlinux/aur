# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=itchcraft
pkgver=0.2.0
pkgrel=1
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
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/claui/itchcraft/archive/v${pkgver}.tar.gz")
sha512sums=('05ab1b535c3be0b58fac1b1a75dcb2fe8d4b737f4552cf2c5d501dc9568445301f5a77564154a163ff58f4c8431ecadcfc69070f04a1eb7aae409db792a9943e')

build() {
  cd "${pkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating man page'
  sphinx-build -aqEW -b man doc/sphinx build/man
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
