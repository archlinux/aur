# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=itchcraft
pkgver=0.1.0
pkgrel=1
pkgdesc='Alternative frontend for heat-based USB insect bite healers'
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
sha512sums=('73471b4eaf445d55fefb566fdcc067254d47478f65255019c5fdcb9d373c71d867ce6d51907dc07095da7b8e1524011a90047be52206fd7267d00abf7535bbf3')

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
