# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

pkgname='python2-urllib3'
_name="${pkgname#python2-}"
# _commit='aa3def7d242525e6e854991247c4b68583d15135'  # 1.26.11
pkgver=1.26.11
pkgrel=1
pkgdesc='HTTP library with thread-safe connection pooling and file post support'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}"
# _repourl="https://github.com/${_name}/${_name}"
license=('MIT')
makedepends=('python2-setuptools')
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
  'python-urllib3-doc: urllib3 documentation'
)
# _tarname="${_name}-${_commit}"
# source=("${_tarname}.tar.gz::${_repourl}/archive/${_commit}.tar.gz")
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
sha256sums=('ea6e8fb210b19d950fab93b60c9009226c63a28808bc8386e05301e25883ac0a')

prepare() {
  cd "${_tarname}"

  printf "Changing hashbangs in *.py files to refer to 'python2'... "
  sed -e '1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
  echo 'done'

  printf "Changing 'setup.cfg': setting 'xfail_strict' from true to false... "
  sed -e '/^xfail_strict/c\xfail_strict = false' \
      -i 'setup.cfg'
  echo 'done'
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
    export PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}"
    python2 setup.py pytest --addopts "$(cat <<-EOM
		--verbose \
		--cache-clear \
		--ignore test/contrib/test_socks.py \
		--deselect test/test_retry.py::TestRetry::test_respect_retry_after_header_sleep \
		--deselect test/test_retry_deprecated.py::TestRetry::test_respect_retry_after_header_sleep \
		--deselect test/with_dummyserver/test_socketlevel.py::TestHeaders::test_request_host_header_ignores_fqdn_dot \
		--deselect test/with_dummyserver/test_proxy_poolmanager.py::TestHTTPSProxyVerification::test_https_proxy_ipv6_san
		EOM
    )"
  )
}

package() {
  depends+=('python2')

  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build
  install -Dm 644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
