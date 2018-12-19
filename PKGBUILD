# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=flask-security
pkgbase=python-flask-security
pkgname=('python-flask-security' 'python2-flask-security')
pkgver=3.0.0
pkgrel=1
pkgdesc='Quick and simple security for Flask applications'
url='https://github.com/mattupstate/flask-security'
arch=('any')
license=('MIT')
makedepends=('python-flask' 'python-flask-login' 'python-flask-mail' 'python-flask-principal'
             'python-flask-wtf' 'python-flask-babelex' 'python-itsdangerous' 'python-passlib'
             'python-sphinx' 'python-setuptools'
             'python2-flask' 'python2-flask-login' 'python2-flask-mail' 'python2-flask-principal'
             'python2-flask-wtf' 'python2-flask-babelex' 'python2-itsdangerous' 'python2-passlib'
             'python2-sphinx' 'python2-setuptools')
#checkdepends=('python-pytest' 'python-pytest-runner' 'python-pytest-cov' 'python-pytest-cache'
              #'python-mock' 'python-sqlalchemy' 'python-flask-sqlalchemy' 'python-bcrypt' 'python-pony'
              #'python2-pytest' 'python2-pytest-runner' 'python2-pytest-cov' 'python2-pytest-cache'
              #'python2-mock' 'python2-sqlalchemy' 'python2-flask-sqlalchemy' 'python2-bcrypt' 'python2-pony')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/mattupstate/flask-security/archive/${pkgver}.tar.gz)
sha512sums=('1176c154e3a4d4326fc64c6d4b986150db17b51b23003ef069596333777afd5857bc33391c46c771144422f610d669ceb96f4b5a1880b9ea374a488d6cb093f6')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -e 's/ --translations//' \
      -e 's/ --pep8//' \
      -e 's/ --flakes//' \
      -i pytest.ini
}

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
  python2 setup.py build
  sphinx-build2 -b text docs docs/_build2/text
  sphinx-build2 -b man docs docs/_build2/man
}

# TODO: test marks not compatible with latest pytest
#check() {
  #cd ${_pkgname}-${pkgver}
  #PYTHONPATH=. py.test
  #PYTHONPATH=. py.test2
#}

package_python-flask-security() {
  depends=('python' 'python-flask' 'python-flask-login' 'python-flask-mail' 'python-flask-principal'
           'python-flask-wtf' 'python-flask-babelex' 'python-itsdangerous' 'python-passlib')
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/flask-security.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

package_python2-flask-security() {
  depends=('python2' 'python2-flask' 'python2-flask-login' 'python-flask-mail' 'python2-flask-principal'
           'python-flask-wtf' 'python2-flask-babelex' 'python2-itsdangerous' 'python2-passlib')
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build2/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build2/man/flask-security.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
