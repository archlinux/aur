# Maintainer: David Runge <dvzrv@archlinux.org>

_name=etesync
pkgname=python-etesync
pkgver=0.9.3
pkgrel=1
pkgdesc="Python API to interact with an EteSync server"
arch=('any')
url="https://pypi.python.org/pypi/etesync/"
license=('LGPL')
depends=('python-appdirs' 'python-asn1crypto' 'python-cffi'
'python-cryptography' 'python-dateutil' 'python-furl' 'python-idna'
'python-orderedmultidict' 'python-packaging' 'python-peewee' 'python-py'
'python-pyasn1' 'python-pycparser' 'python-pyparsing' 'python-pytz'
'python-requests' 'python-scrypt' 'python-six' 'python-vobject')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-coverage')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('da2dcdb646f8c0ea9d4f53580e4aae395447cc2226f3b22f883138991b22b065fc92b2610eb9c465326da607470b2954a35dfb8fcb3a083d2915fea2c5c0754e')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  # only run relevant tests:
  # https://github.com/etesync/pyetesync/issues/5
  pytest -vvv tests/{test_collections.py,test_crypto.py}
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
