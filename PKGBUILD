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
source=(
  "git+${url}.git"
)
sha512sums=(
  'SKIP'
)

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
    PYTHONPATH="$PWD/../.." \
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
    -m installer \
    -d "$pkgdir" \
    dist/*.whl
  install \
    -Dm644 LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set sw=2 sts=-1 et:
