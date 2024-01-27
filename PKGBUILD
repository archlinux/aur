# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: codedust
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Clayton Craft <clayton at craftyguy dot net>

_py="python"
_pkg="setuptools-rust"
_Pkg="setuptools_rust"
_pkgbase="${_py}-${_pkg}"
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
)
pkgver=1.8.1
pkgrel=1
_pkgdesc=(
  "Compile and distribute Python extensions written"
  "in rust as easily as if they were written in C.")
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
license=(
  'MIT'
)
url="https://github.com/PyO3/${_pkg}"
depends=(
  'rust'
  "${_py}-setuptools"
  "${_py}-semantic-version"
)
makedepends=(
  'git'
  "${_py}-build"
  "${_py}-installer"
  "${_py}-wheel"
  "${_py}-setuptools-scm"
)
checkdepends=(
  "${_py}-pytest"
  "${_py}-pytest-benchmark"
  "${_py}-beautifulsoup4"
  "${_py}-lxml"
  "${_py}-cffi"
)
provides=(
  "${_pkg}=${pkgver}"
  "${_pkg}-git=${pkgver}"
  "${_pkgbase}=${pkgver}"
)
conflicts=(
  "${_pkg}"
  "${_pkg}-git"
  "${_pkgbase}"
)
source=(
  "git+${url}.git"
)
sha512sums=(
  'SKIP'
)

_parse_ver() {
  local \
    _pkgver="${1}" \
    _out="" \
    _ver \
    _rev \
    _commit
  _ver="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $1}')"
  _rev="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $2}')"
  _commit="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $3}')"
  _out=${_ver}
  if [[ "${_rev}" != "" ]]; then
    _out+=".r${_rev}"
  fi
  if [[ "${_commit}" != "" ]]; then
    _out+=".${_commit}"
  fi
  echo \
    "${_out}"
}

pkgver() {
  local \
    _pkgver
  cd \
    "${_pkg}" || \
    exit
  _pkgver="$( \
    git \
      describe \
      --tags | \
        sed \
          's/_/./g;s/-/+/g')"
  _parse_ver \
    "${_pkgver}"
}

build() {
  cd \
    "${_pkg}"
  "${_py}" \
    -m \
      build \
      -nw
}

check() {
  cd \
    "${_pkg}"
  for _dir \
    in examples/*; do
    pushd \
      "${_dir}"
    PYTHONPATH="${PWD}/../.." \
      "${_py}" \
        -m build \
	-nw
    "${_py}" \
      -m \
        installer \
        -d \
	  tmp_install \
	dist/*.whl
    [[ -d tests || -d test ]] && \
      PYTHONPATH="$PWD/tmp_install/usr/lib/python3.11/site-packages" \
        pytest \
	  tests
    popd
  done
  pytest \
    --doctest-modules \
      "${_Pkg}"
}

package() {
  cd "${_pkg}"
  "${_py}" \
    -m \
      installer \
    --destdir="${pkgdir}" \
    dist/*.whl
  install \
    -Dm644 LICENSE \
    -t \
      "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
