# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=flask-babelex
pkgname=python-flask-babelex
_gitcommit=d6993064993635ace5af98cbf5368dca593603db
pkgver=0.9.3.r2.gd699306
pkgrel=3
pkgdesc='Adds i18n/l10n support to Flask applications'
url='https://github.com/mrjoes/flask-babelex'
arch=('any')
license=('BSD')
depends=('python' 'python-flask' 'python-babel' 'python-speaklater' 'python-jinja')
makedepends=('git' 'python-sphinx' 'python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}::"git+https://github.com/mrjoes/flask-babelex#commit=${_gitcommit}")
sha512sums=('SKIP')


pkgver() {
  cd ${pkgname}
  git describe --always --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  git tag 0.9.3 20519259977857ae6357a31fc2d18e7fbdee3cd4
  sed -e 's/April 2010 15:46/April 2010 um 15:46/' \
      -e 's/12.04.2010 15:46:00/12.04.2010, 15:46:00/' \
      -i tests/tests.py
}

build() {
  cd ${pkgname}
  python setup.py build
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
}

check() {
  cd ${pkgname}
  py.test tests/tests.py
}

package() {
  cd ${pkgname}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/flaskbabel.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
