# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

pkgname='python2-urllib3'
_name="${pkgname#python2-}"
pkgver=1.26.9
pkgrel=9
pkgdesc='HTTP library with thread-safe connection pooling and file post support'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
_repourl="https://github.com/${_name}/${_name}"
license=('MIT')
depends=('python2')
makedepends=(
  'python2-setuptools'
)
checkdepends=(
  'python2-flaky'
  'python2-mock'
  'python2-pyopenssl'
# 'python2-pysocks'         # seems unrealiable; test cases are indeterministic
  'python2-pytest-freezegun>=0.4.0'
  'python2-pytest-runner'
  'python2-pytest-timeout'
  'python2-tornado'
  'python2-trustme'
)
optdepends=(
# 'python2-brotli: Brotli support via pure-Python2 module'
# 'python2-brotlicffi: Brotli support via native binary library'
  'python2-pyopenssl: secure connection support'
  'python2-pysocks: SOCKS proxy support (deprecated)'
  'python2-gcp-devrel-py-tools: Google AppEngine support'
  'python-urllib3-doc: urllib3 documentation'
)
_tarname="${_name}-${pkgver}"
source=("${_repourl}/archive/${pkgver}/${_tarname}.tar.gz")
b2sums=('0e4c7ebe3f309004463a546c0395c0e22cf57432d587d7cb4b6190afd37fb6f8669ea5c8f9a8a5f88a53c62a3944ebd09f20f5ec93e352959fa9cbea682ccc76')

prepare() {
  echo "Fixing hardcoded urllib3.connection.RECENT_DATE field - it's expired if earlier than two years"
  sed -e '/RECENT_DATE[ ]*=[ ]*datetime.date/c\RECENT_DATE = datetime.date(2022, 1, 1)' \
      -i ${_tarname}/src/${_name}/connection.py
}

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
      "--verbose --cache-clear --ignore test/contrib/test_socks.py --deselect test/test_retry.py::TestRetry::test_respect_retry_after_header_sleep --deselect test/test_retry_deprecated.py::TestRetry::test_respect_retry_after_header_sleep --deselect test/with_dummyserver/test_socketlevel.py::TestHeaders::test_request_host_header_ignores_fqdn_dot"
  )
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build
  install -Dm 644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
