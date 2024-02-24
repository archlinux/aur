# Maintainer: Claudia Pellegrino <clau@tiqua.de>

pkgname=funiculi
pkgver=0.1.4
pkgrel=1
pkgdesc='Control your Denon AVR amplifier from the command line'
arch=('any')
url='https://github.com/claui/funiculi'
license=('Apache-2.0')
depends=(
  'nmap'
  'pulseaudio-dlna'
  'python-colorama'
  'python-fire'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-myst-parser'
  'python-poetry-core'
  'python-sphinx'
  'python-wheel'
)
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/funiculi/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'caf14e2f717aa0229e2b42e83a722f298f1bbcf0c4c105985dfe1a454c123be96c1b3a9949478d70c64db4d372043675284a0e73836d6e7232faa76544664a9a'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating man page'
  sphinx-build -aqEW -b man doc/sphinx build/man
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'

  echo >&2 'Packaging the man page'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man1" \
    build/man/*.1
}
