# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: David Runge <dvzrv@archlinux.org>

_os="$( \
  uname \
    -o)"
_pkg=maturin
_py="python"
_pkgbase="${_pkg}"
pkgbase="${_pkg}-git"
pkgname=(
  "${pkgbase}"
  "${_py}-${_pkg}-git"
)
pkgver="1.4.0.r31.g6030857e"
pkgrel=1
_pkgdesc=(
  "Build and publish crates with pyo3,"
  "rust-c${_py} and cffi bindings"
)
pkgdesc="${_pkgdesc[*]}"
url="https://github.com/PyO3/${_pkg}"
arch=(
  x86_64
  arm
)
license=(
  'Apache-2.0 OR MIT'
)
makedepends=(
  bzip2
  gcc-libs
  git
  glibc
  "${_py}-build"
  "${_py}-installer"
  "${_py}-setuptools"
  "${_py}-setuptools-rust"
  "${_py}-wheel"
  rust
)
# disable LTO until ring can be built with it:
# https://github.com/briansmith/ring/issues/1444
options=(
  !lto
)
source=(
  "${_pkgbase}::git+${url}.git"
)
sha512sums=(
  'SKIP'
)
b2sums=(
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

_pick() {
  local \
    p="${1}" \
    f \
    d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir \
      -p \
        "$(dirname "$d")"
    mv \
      "$f" \
      "$d"
    rmdir \
    -p \
    --ignore-fail-on-non-empty \
    "$( \
      dirname \
        "$f")"
  done
}

prepare() {
  local \
    _target
  _target="${CARCH}-unknown-linux-gnu"
  [[ "${_os}" == "Android" ]] && \
    _target="${CARCH}-linux-androideabi"
  cd \
    "${_pkg}"
  cargo \
    fetch \
    --locked \
    --target \
      "${_target}"
}

build() {
  cd \
    "${_pkg}"
  "${_py}" \
    -m \
      build \
      --wheel \
      --no-isolation
}

package_maturin-git() {
  depends=(
    bzip2
    gcc-libs
    glibc
    rust
  )
  provides+=(
    "${_pkgbase}=${pkgver}"
  )
  conflicts+=(
    "${_pkgbase}"
  )
 cd \
    "${_pkg}"
  "${_py}" \
    -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl
  install \
    -vDm 644 \
    {Changelog,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install \
    -vDm 644 \
    license-mit \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  (
    cd \
      "${pkgdir}"
    _pick \
      "${_py}-${_pkg}" \
      usr/lib
  )
}

package_python-maturin-git() {
  pkgdesc+=" - Python bindings"
  depends=(
    "${_pkg}=${pkgver}"
    "${_py}"
  )
  provides+=(
    "${_py}-${_pkg}=${pkgver}"
  )
  conflicts+=(
    "${_py}-${_pkg}"
  )
  mv \
    -v \
    "${_py}-${pkg}/"* \
    "${pkgdir}"
  install \
    -vDm 644 \
    "${pkgdir}/license-mit" \
    -t \
    "${pkgdir}/usr/share/licenses/${_pkg}/"
}

# vim:set sw=2 sts=-1 et:
