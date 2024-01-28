# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_py="python"
_pkg="toml"
_pkgbase="${_py}-${_pkg}"
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
)
pkgver="0.10.2.r9.g65bab75"
pkgrel=1
_pkgdesc=(
  "A Python library for parsing"
  "and creating TOML"
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
_http="https://github.com"
_ns="uiri"
url="${_http}/${_ns}/${_pkg}"
license=(
  'MIT'
)
depends=(
  "${_py}"
)
makedepends=(
  "git"
  "${_py}-build"
  "${_py}-installer"
  "${_py}-setuptools"
  "${_py}-wheel"
)
checkdepends=(
  "${_py}-numpy"
  "${_py}-pytest"
)
provides=(
  "${_pkgbase}=${pkgver}"
)
conflicts=(
  "${_pkgbase}"
)
source=(
  "${_pkg}::git+${url}.git"
  "${_pkgbase}-0.10.1-install_type_hints.patch"
)
sha256sums=(
  'SKIP'
  '7597ca115ba497797cf7c1330f5e93146ff5a924ef3bc331a8e77da12ee880cf'
)
b2sums=(
  'SKIP'
  '23449773cb0c7004d6c367c4cef666561e16fcd38166d17428a8192f6649bdfa76277f20bd4662f7571bc020fba6e5614e8f7dcf8502d18eb1e0ede6cb3ddde2'
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

prepare() {
  cd \
    "${_pkg}"
  patch \
    -Np1 \
    -i \
      ../"${_pkgbase}-0.10.1-install_type_hints.patch"
}

build() {
  cd \
    "${_pkg}"
  "${_py}" \
    -m build \
    --wheel \
    --skip-dependency-check \
    --no-isolation
}

check() {
  cd \
    "${_pkg}"
  export \
    PYTHONPATH="../build/lib/:${PYTHONPATH}"
  # disable useless tests
  pytest \
    -v \
      tests \
    -k \
      'not test_invalid_tests and not test_valid_tests'
}

package() {
  local \
    _site_packages
  cd \
    "${_pkg}"
  "${_py}" \
    -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl
  install \
    -vDm 644 \
    README.rst \
    -t "${pkgdir}/usr/share/doc/${pkgbase}"

  # Symlink license file
  _site_packages="$( \
    "${_py}" \
      -c \
        "import site; print(site.getsitepackages()[0])")"
  install \
    -d \
    "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln \
    -s \
    "${_site_packages}/${_pkg}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
