# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=funiculi
pkgver=0.3.1
pkgrel=1
pkgdesc='Control your Denon AVR amplifier from the command line'
arch=('any')
url='https://github.com/claui/funiculi'
license=('Apache-2.0')
depends=(
  'pulseaudio-dlna-cygn'
  'python'
  'python-colorama'
  'python-fire'
)
makedepends=(
  'python-build'
  'python-hatch'
  'python-installer'
  'python-myst-parser'
  'python-sphinx'
  'python-sphinx-autoapi'
  'python-wheel'
)
checkdepends=('python-pytest')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/funiculi/archive/v${pkgver}.tar.gz"
)

sha512sums=('d951f98c6f71bb7182b420bf432250713e20c94f0835f4dd43126dc37dce107cb13ec1f45301a5cfeb8be02d7d557fb001b49123243ef03cc54c4ad98540123c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
