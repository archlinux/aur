# Maintainer: David Runge <dvzrv@archlinux.org>

_name=etesync
pkgname=python-etesync
pkgver=0.10.0
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
sha512sums=('bb16e57d0081cd3627e9e7e2465176deae29c45b1b9033cbd3fc463bab4d2537d89aa0f15d202db860ef0d6b057fe96543a6361523b828da86bf811f407b3c43')

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
