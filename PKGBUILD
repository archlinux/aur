# Maintainer: Claudia Pellegrino <clau@tiqua.de>

pkgname=funiculi
pkgver=0.2.0
pkgrel=3
pkgdesc='Control your Denon AVR amplifier from the command line'
arch=('any')
url='https://github.com/claui/funiculi'
license=('Apache-2.0')
depends=(
  'nmap'
  'pulseaudio-dlna-cygn'
  'python'
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
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/funiculi/archive/v${pkgver}.tar.gz"
)

sha512sums=('cd743fd555480b9797d2eaa71e0d98e09c07bb4012ae53e13983956bd5f8184b763a5f2844f81e93acf29c44f65b872e34493cd8ffbe2d229de3322990b64e63')

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
