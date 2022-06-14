# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname='python2-requests'
_name="${pkgname#python2-}"
pkgver=2.27.1
pkgrel=1
pkgdesc='HTTP for Humans (for Python 2)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=(
  'python2'
  'python2-chardet'
  'python2-idna'
  'python2-urllib3'
)
makedepends=('python2-setuptools')
# checkdepends=(
#   'python2-pytest'
#   'python2-pytest-httpbin'
#   'python2-pytest-mock'
#   'python2-pysocks'
#   'python2-trustme'
# )
optdepends=(
  'python2-ndg-httpsclient: HTTPS requests with SNI support'
  'python2-pysocks: SOCKS proxy support'
)
_sourcedirname="${_name}-${pkgver}"
source=("https://github.com/psf/requests/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'certs.patch')
b2sums=('302fa6f3be95840e7c79a036d5d6bf354f9db0857542969759690c312b31e26fc4779e886b616bd624cb17a53da0342597988bd4aee88dbeb0f6a2442b8a6ced'
        'b6a7c9796a8ffedebcdbf0d2f95c40b1bbfa0beb45a3c7d5b493a459c4516533992291c720cf02e291cdbbf554dd0bf25c1312f4be41e39acd586b41911ad5b0')

prepare() {
  cd "${_sourcedirname}"
  # Stay with chardet for now: https://github.com/psf/requests/issues/5871
  sed -e '/certifi/d' \
      -e "s/,<.*'/'/" \
      -e '/charset_normalizer/d' \
      -i 'setup.py'
  patch -p1 -i "${srcdir}/certs.patch"

  # Change hashbangs to python2
  sed -e 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
      -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
      -e 's|#![ ]*/bin/env python$|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

build() {
  cd "${_sourcedirname}"
  python2 setup.py build
}

# check() {
#   # Seems to be a problem about pytest-httpbin:
#   # pytest-httpbin server hit an exception serving request: [SSL: HTTP_REQUEST] http request (_ssl.c:1129)
#   # pytest-httpbin server hit an exception serving request: [SSL: TLSV1_ALERT_UNKNOWN_CA] tlsv1 alert unknown ca (_ssl.c:1129)
# 
#   cd "${_sourcedirname}"
#   pytest tests --deselect tests/test_requests.py::TestRequests::test_pyopenssl_redirect
# }

package() {
  cd "${_sourcedirname}"
  python2 setup.py install --skip-build -O1 --root="${pkgdir}"
}
