# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

_py="python2"
_pkg="urllib3"
pkgname="${_py}-${_pkg}"
# _commit='aa3def7d242525e6e854991247c4b68583d15135'  # 1.26.11
pkgver=1.26.15
pkgrel=1
_pkgdesc='HTTP library with thread-safe connection pooling and file post support'
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
_http="https://github.com"
url="https://pypi.org/project/${_pkg}/${pkgver}"
_url="${_http}/${_pkg}/${_pkg}"
license=(
  'MIT'
)
makedepends=(
  "${_py}-setuptools"
)
checkdepends=(
  "${_py}-flaky"
  "${_py}-mock"
  "${_py}-pyopenssl"
# "${_py}-pysocks"         # seems unrealiable; test cases are indeterministic
  "${_py}-pytest-freezegun>=0.4.0"
  "${_py}-pytest-runner"
  "${_py}-pytest-timeout"
  "${_py}-tornado"
  "${_py}-trustme"
)
optdepends=(
  "${_py}-brotli: Brotli support via pure-Python2 module"
# "${_py}-brotlicffi: Brotli support via native binary library"
  "${_py}-pyopenssl: secure connection support"
  "${_py}-pysocks: SOCKS proxy support (deprecated)"
  'python-urllib3-doc: urllib3 documentation'
)
# _tarname="${_pkg}-${_commit}"
_tarname="${_pkg}-${pkgver}"
_pypi="https://files.pythonhosted.org/packages/source"
source=(
  # "${_tarname}.tar.gz::${_repo}/archive/${_commit}.tar.gz"
  "${_pypi}/${_pkg::1}/${_pkg}/${_tarname}.tar.gz"
)
sha256sums=(
  '8a388717b9476f934a21484e8c8e61875ab60644d29b9b39e11e4b9dc1c6b305'
)

prepare() {
  cd \
    "${_tarname}"

  printf \
    "Changing hashbangs in *.py files to refer to '${_py}'... "
  sed \
    -e \
      '1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env python2|' \
    -i \
      $( \
        find \
	  . \
	  -name \
	    '*.py')
  echo \
    'done'
  printf \
    "Changing 'setup.cfg': setting 'xfail_strict' from true to false... "
  sed \
    -e \
      '/^xfail_strict/c\xfail_strict = false' \
    -i \
    'setup.cfg'
  echo \
    'done'
}

build() {
  cd \
    "${_tarname}"
  "${_py}" \
    setup.py \
      build
}

check() {
  cd \
    "${_tarname}"
  (
    echo \
      '-- Using LC_ALL=C.UTF-8 locale to ensure UTF-8' \
      'filesystem encoding is used in Python 2'
    export \
      LC_ALL=C.UTF-8 \
      PYTHONDONTWRITEBYTECODE=1 \
      PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}"
    "${_py}" \
      setup.py \
        pytest \
          --addopts \
            "$( \
      cat <<-EOM
        --verbose \
        --cache-clear \
        --ignore \
          test/contrib/test_socks.py \
        --deselect \
          test/test_retry.py::TestRetry::test_respect_retry_after_header_sleep \
        --deselect \
          test/test_retry_deprecated.py::TestRetry::test_respect_retry_after_header_sleep \
        --deselect \
          test/with_dummyserver/test_socketlevel.py::TestHeaders::test_request_host_header_ignores_fqdn_dot \
        --deselect \
          test/with_dummyserver/test_proxy_poolmanager.py::TestHTTPSProxyVerification::test_https_proxy_ipv6_san
		EOM
              )"
  )
}

package() {
  local \
    _setup_opts=()
  _setup_opts=(
    --root="${pkgdir}"
    # --prefix='/usr'
    --optimize=1
    --skip-build
  )
  depends+=(
    "${_py}"
  )
  cd \
    "${_tarname}"
  "${_py}" \
    setup.py \
      install \
        "${_setup_opts[@]}"
  install \
    -Dm 644 \
    'LICENSE.txt' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
