# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-plotink
_gitpkgname=plotink
pkgver=1.14.2
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

sha512sums=('7d86f8d8b59e6d62fbcddf7123d11d96420a7fcfeacc1daf83bc2c064b025c11a1c8d011ba715813f34da220a090569c0b1a67b4fa7daae8a2eb640503c04888')

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
