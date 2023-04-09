# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=Flask-Gravatar
pkgname=python-flask-gravatar
pkgver=0.5.0
pkgrel=8
pkgdesc='Small and simple gravatar usage in Flask'
url='https://github.com/zzzsochi/Flask-Gravatar/'
arch=('any')
license=('BSD')
makedepends=('python-flask' 'python-sphinx' 'python-setuptools' 'python-pytest-runner')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zzzsochi/Flask-Gravatar/archive/v${pkgver}.tar.gz)
sha256sums=('9f9ea35b3537f635a25a09390821b768c9c3cf53274e16ffabbfc1f8c6e77d55')
sha512sums=('8acc5374e559687cc1b5fbaa90c1d17e96fd91e8b01d3df8083bc10c92afefb3725c03c4640e92e73d727320fc26235f80f6dfe36a06aeff49268af44110a23c')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
}

check() {
  cd ${_pkgname}-${pkgver}
  # Remove pytest.ini to not run coverage/pep8
  rm pytest.ini
  PYTHONPATH=. pytest .
}

package() {
  depends=('python' 'python-flask')
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.rst CHANGES.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/flaskgravatar.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
