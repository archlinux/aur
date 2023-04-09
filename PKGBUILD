# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=flask-babelex
pkgname=python-flask-babelex
pkgver=0.9.4
pkgrel=6
pkgdesc='Adds i18n/l10n support to Flask applications'
url='https://github.com/mrjoes/flask-babelex'
arch=('any')
license=('BSD')
depends=('python' 'python-flask' 'python-babel' 'python-speaklater' 'python-jinja')
makedepends=('python-sphinx' 'python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/mrjoes/flask-babelex/archive/${pkgver}.tar.gz")
sha512sums=('e5591bcb83ca7e7644b1d06e604834369973bfba5050bd6890ad57125731981cda1e893544eea61cf69dca536e5473e2e50b08b36b0c3daee15d66f3815bd986')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -e 's/April 2010 15:46/April 2010 um 15:46/' \
      -e 's/12.04.2010 15:46:00/12.04.2010, 15:46:00/' \
      -i tests/tests.py
}

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
}

check() {
  cd ${_pkgname}-${pkgver}
  py.test tests/tests.py
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/flaskbabel.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
