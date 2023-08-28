# Maintainer: Pellegrino Prevete < pellegrinoprevete@gmail.com >
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_py="python2"
_pkg="requests"
pkgname="${_py}-${_pkg}"
_name="${_pkg}"
_commit='fa1b0a367abc8488542f7ce7c02a3614ad8aa09d'
pkgver=2.27.1.r5.gfa1b0a36
pkgrel=1
pkgdesc='HTTP for Humans (legacy Python 2 version)'
arch=('any')
url="https://pypi.org/project/${_pkg}"
_repourl="https://github.com/psf/${_pkg}"
license=('Apache')
makedepends=('python2-setuptools')
_depends_that_are_checkdepends=(
    'ca-certificates-utils'
    'python2-chardet'
    'python2-idna'
    'python2-urllib3'
)
_checkdepends_needed=(
  "${_py}-flask"
  "${_py}-pytest-mock"
  "${_py}-pytest-httpbin"
  # optional; enables parallel testing, but unavailable
  # "${_py}-pytest-xdist"
  "${_py}-trustme"
)
optdepends=(
  "${_py}-pysocks: SOCKS proxy support (deprecated)")
optdepends+=(
  "${_checkdepends_needed[@]/%/: needed for check() during build}")
_tardirname="${_pkg}-${_commit}"
source=(
  "python-${_pkg}-${pkgver}.tar.gz::${_repourl}/archive/${_commit}.tar.gz"
  'certs.patch')
b2sums=(
  '350b89ec150702b6b1ecb9faa3f20e79977620b828df20b625a422216ff33a040ab561ed07bb14663c5319802f7d37baafcb5752746faf702dd81b1dbb968fc7'
  'b6a7c9796a8ffedebcdbf0d2f95c40b1bbfa0beb45a3c7d5b493a459c4516533992291c720cf02e291cdbbf554dd0bf25c1312f4be41e39acd586b41911ad5b0')

_checkinstalled() {
  pacman --deptest $@
}

prepare() {
  cd "${_tardirname}"

  echo 'Patching setup.py:'
  echo '- removing unnecessary upper version constraints'
  echo "- removing certifi and charset_normalizer requirements"
  sed -e "s/,<.*'/'/" \
      -e '/certifi/d' \
      -e '/charset_normalizer/d' \
      -i 'setup.py'
  echo

  echo "Patching certs.py: use Arch's default ca-certificates.crt"
  patch --verbose \
	-p1 \
	-i "${srcdir}/certs.patch"
  echo

  echo "Changing hashbangs in *.py files to refer to 'python2'"
  sed -e "1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env ${_py}|" \
      -i $(find . -name '*.py')
}

build() {
  cd "${_tardirname}"
  "${_py}" setup.py build
}

check() {
  ( _checkinstalled \
        "${_checkdepends_needed[@]}" \
        "${_depends_that_are_checkdepends[@]}" > \
      /dev/null ) || \
    echo "Skipping testing: checkdepends not installed:"; \
    ( _checkinstalled \
          "${_checkdepends_needed[@]}" \
	  "${_depends_that_are_checkdepends[@]}" ) || \
      return 0

  # Seems to be a problem about pytest-httpbin:
  # pytest-httpbin server hit an exception
  # serving request: [SSL: HTTP_REQUEST] http request (_ssl.c:1129)
  # pytest-httpbin server hit an exception serving request:
  # [SSL: TLSV1_ALERT_UNKNOWN_CA] tlsv1 alert unknown ca (_ssl.c:1129)

  cd "${_tardirname}"
  (
    echo '-- Using LC_ALL=C.UTF-8 locale to ensure ' \
	 'UTF-8 filesystem encoding is used in Python 2'

    ( _checkinstalled \
          "${_py}-pysocks" > \
        /dev/null ) || \
      echo '-- Disabling tests for python2-pysocks: not installed'; \
      export \
        _pytest_conditional_options=(
	  -k="not test_use_proxy_from_environment")
    echo

    export LC_ALL=C.UTF-8
    export PYTHONDONTWRITEBYTECODE=1
    export PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}"
    set -x
    pytest2 tests \
        --verbose \
        --cache-clear \
        --deselect \
          'tests/test_requests.py::TestRequests::test_pyopenssl_redirect' \
        "${_pytest_conditional_options[@]}"
  )
}

package() {
  depends=(
    'python2'
    "${_depends_that_are_checkdepends[@]}"
  )
  cd "${_tardirname}"
  python2 setup.py install --root="${pkgdir}" \
	                   --prefix='/usr' \
			   --optimize=1 \
			   --skip-build
  install --verbose \
	  -Dm 644 \
	  'README.md' \
	  -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
