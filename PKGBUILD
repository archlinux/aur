# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname='python2-requests'
_name="${pkgname#python2-}"
pkgver=2.27.1
pkgrel=3
pkgdesc='HTTP for Humans (legacy Python 2 version)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
# checkdepends=(
#   'python2-pytest'
#   'python2-pytest-mock'
#   'python2-pytest-httpbin'
#   'python2-pytest-xdist'
#   'python2-pysocks'
#   'python2-trustme'
# )
optdepends=('python2-pysocks: SOCKS proxy support')
_tarname="${_name}-${pkgver}"
source=("https://github.com/psf/${_name}/releases/download/v${pkgver}/${_tarname}.tar.gz"
        'certs.patch')
b2sums=('a7fed53998fa61b3d03abd254a0cee76450c5b60d76f80aa6b91f32dca1dae5d2c51987b3d3f2138d72c50790e35c36cb03eb5974554ac4eb1a902eff79b5bdd'
        'b6a7c9796a8ffedebcdbf0d2f95c40b1bbfa0beb45a3c7d5b493a459c4516533992291c720cf02e291cdbbf554dd0bf25c1312f4be41e39acd586b41911ad5b0')

prepare() {
  cd "${_tarname}"

  echo 'Patching setup.py:'
  echo '- removing unnecessary upper version constraints'
  echo "- removing certifi and charset_normalizer requirements"
  sed -e "s/,<.*'/'/" \
      -e '/certifi/d' \
      -e '/charset_normalizer/d' \
      -i 'setup.py'

  echo "Patching certs.py: use Arch's default ca-certificates.crt"
  patch --verbose -p1 -i "${srcdir}/certs.patch"

  echo 'Changing hashbangs in *.py files to refer to python2'
  sed -e '1s|#![ ]*/usr/bin/python.*|#!/usr/bin/python2|' \
      -e '1s|#![ ]*/usr/bin/env python.*|#!/usr/bin/env python2|' \
      -e '1s|#![ ]*/bin/env python.*|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

# check() {
#   # Seems to be a problem about pytest-httpbin:
#   # pytest-httpbin server hit an exception serving request: [SSL: HTTP_REQUEST] http request (_ssl.c:1129)
#   # pytest-httpbin server hit an exception serving request: [SSL: TLSV1_ALERT_UNKNOWN_CA] tlsv1 alert unknown ca (_ssl.c:1129)
# 
#   cd "${_tarname}"
#   pytest tests --deselect tests/test_requests.py::TestRequests::test_pyopenssl_redirect
# }

package() {
  depends=(
    'python2-chardet'
    'python2-idna'
    'python2-urllib3'
  )
  cd "${_tarname}"
  python2 setup.py install --skip-build --optimize=1 --root="${pkgdir}"
}
