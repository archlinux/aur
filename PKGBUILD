# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=python-plotink
_gitpkgname=plotink
pkgver=1.14.3
pkgrel=1
pkgdesc='Common files for Inkscape extensions to drive EggBot, WaterColorBot, and similar plotter-type machines'
arch=('any')
url='https://github.com/evil-mad/plotink'
license=('MIT')
depends=(
  'python'
  'python-ink-extensions'
  'python-mpmath'
  'python-packaging'
  'python-pyserial'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/evil-mad/plotink/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=('81729cc007289c844a907026b734d0fbb09763ea987269bd4757389c23d635c13001d49c61bb7486e5eb44f3e152e18a26c6e74e42c23da46246f43e59d7e148')

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

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${_gitpkgname}-${pkgver}/README.md"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${_gitpkgname}-${pkgver}/LICENSE"
}
