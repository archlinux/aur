# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

pkgname='python2-urllib3'
_name="${pkgname#python2-}"
pkgver=1.26.9
pkgrel=4
pkgdesc='HTTP library with thread-safe connection pooling and file post support'
arch=('any')
url="https://github.com/${_name}/${_name}"
license=('MIT')
depends=('python2')
makedepends=(
# 'python2-brotli'
  'python2-ndg-httpsclient'
  'python2-pyasn1'
  'python2-pyopenssl'
  'python2-pysocks'
  'python2-setuptools'
)
checkdepends=(
  'python2-dateutil'
  'python2-flaky'
  'python2-nose'
  'python2-psutil'
  'python2-pytest-runner'
  'python2-tornado'
  'python2-trustme'
)
optdepends=(
# 'python2-brotli: Brotli support'
  'python2-idna: support for internationalized domain names (IDNA)'
  'python2-pyopenssl: security support'
  'python2-pysocks: SOCKS support'
  'python2-gcp-devrel-py-tools: Google AppEngine support'
  'python-urllib3-doc: urllib3 documentation'
)
_tarname="${_name}-${pkgver}"
source=("${url}/archive/${pkgver}/${_tarname}.tar.gz"
#       "${_name}-use-brotli-or-brotli-cffi.patch::${url}/pull/2099.patch"
)
b2sums=('0e4c7ebe3f309004463a546c0395c0e22cf57432d587d7cb4b6190afd37fb6f8669ea5c8f9a8a5f88a53c62a3944ebd09f20f5ec93e352959fa9cbea682ccc76')

# prepare() {
#   patch -d "${_tarname}" -p1 -i "../${_name}-use-brotli-or-brotli-cffi.patch" || :
# }

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"
  (
    echo '-- Using LC_ALL=C.UTF-8 locale to ensure UTF-8 filesystem encoding is used in Python 2'
    export LC_ALL=C.UTF-8
    export PYTHONDONTWRITEBYTECODE=1
    python2 setup.py pytest --addopts \
      "--deselect test/test_retry.py::TestRetry::test_respect_retry_after_header_sleep --deselect test/test_retry_deprecated.py::TestRetry::test_respect_retry_after_header_sleep --deselect test/with_dummyserver/test_socketlevel.py::TestHeaders::test_request_host_header_ignores_fqdn_dot"
  )
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build
  install -Dm 644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
