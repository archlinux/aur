# Maintainer: David Runge <dave@sleepmap.de>

_name=etesync
pkgname=python-etesync
pkgver=0.6.1
pkgrel=1
pkgdesc="Python API to interact with an EteSync server."
arch=('any')
url="https://pypi.python.org/pypi/etesync/"
license=('LGPL')
depends=('python-appdirs' 'python-asn1crypto' 'python-cffi' 'python-coverage'
'python-cryptography' 'python-furl' 'python-idna' 'python-orderedmultidict'
'python-packaging' 'python-peewee' 'python-py' 'python-pyasn1'
'python-pycparser' 'python-pyparsing' 'python-dateutil' 'python-requests'
'python-scrypt' 'python-six' 'python-vobject')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('d779593e43e08a103c626057c6274dc00d1eef318a08dc052e9360d38132350c15f6dd99e607834590878e745efad153357348c2199d13d5ee22c9fd2485d3a2')

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
  # disable intermingled integration tests
  # https://github.com/etesync/pyetesync/issues/12
  pytest -k 'not test_crud \
            and not test_content_crud \
            and not test_syncing \
            and not test_unicode' \
    tests/{test_collections.py,test_crypto.py}
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm 644 {DESCRIPTION.rst,README.md}
}

