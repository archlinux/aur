# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=flask-babelex
pkgbase=python-flask-babelex
pkgname=('python-flask-babelex' 'python2-flask-babelex')
_gitcommit=d6993064993635ace5af98cbf5368dca593603db
pkgver=0.9.3.r2.gd699306
pkgrel=1
pkgdesc='Adds i18n/l10n support to Flask applications'
url='https://github.com/mrjoes/flask-babelex'
arch=('any')
license=('BSD')
makedepends=('git' 'python-flask' 'python-babel' 'python-speaklater' 'python-jinja'
             'python-sphinx' 'python-setuptools'
             'python2-flask' 'python2-babel' 'python2-speaklater' 'python2-jinja'
             'python2-sphinx' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
source=(${pkgbase}::"git+https://github.com/mrjoes/flask-babelex#commit=${_gitcommit}")
sha512sums=('SKIP')


pkgver() {
  cd ${pkgbase}
  git describe --always --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgbase}
  git tag 0.9.3 20519259977857ae6357a31fc2d18e7fbdee3cd4
  sed -e 's/April 2010 15:46/April 2010 um 15:46/' \
      -e 's/12.04.2010 15:46:00/12.04.2010, 15:46:00/' \
      -i tests/tests.py
}

build() {
  cd ${pkgbase}
  python setup.py build
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
  python2 setup.py build
  sphinx-build2 -b text docs docs/_build2/text
  sphinx-build2 -b man docs docs/_build2/man
}

check() {
  cd ${pkgbase}
  py.test tests/tests.py
  py.test2 tests/tests.py
}

package_python-flask-babelex() {
  depends=('python' 'python-flask' 'python-babel' 'python-speaklater' 'python-jinja')
  cd ${pkgbase}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/flaskbabel.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

package_python2-flask-babelex() {
  depends=('python2' 'python2-flask' 'python2-babel' 'python2-speaklater' 'python2-jinja')
  cd ${pkgbase}
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build2/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build2/man/flaskbabel.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
