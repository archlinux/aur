# Maintainer:  dreieck
# Contributor: dreieck
# Contributor: Federico Cassani <federico dot cassani at outlook dot com> 

_pyname="geonamescache"
_pkgname="python-${_pyname}"
pkgname="${_pkgname}"
pkgver=3.0.0
pkgrel=1
pkgdesc="A Python library that provides functions to retrieve names, ISO and FIPS codes of continents, countries as well as US states and counties as Python dictionaries. The country and city datasets also include population and geographic data."
arch=('any')
url="https://pypi.org/project/geonamescache/"
license=('MIT')
depends=(
  'python>=3.10'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
## 2026-02-02: `check()` is disabled since it fails since it runs no test.
# checkdepends=(
#   'python-pytest'
# )
source=(
  # "${_pyname}-${pkgver}.tar.gz::https://github.com/yaph/geonamescache/archive/refs/tags/${pkgver}.tar.gz" # Do not download from github, since it does not contain data.
  "${_pyname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/25/16/250e1be82f1a10581361ddc0d379a37c5660f1818fed780ac42ef6706540/geonamescache-${pkgver}.tar.gz" # See https://pypi.org/project/geonamescache/#files for up to date release.
)
sha256sums=(
  '6eca4a4ceca134a6827dc36b9a0415428081129ec1d731ea496f63f9e9e450ba'
)

build() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation
}

## 2026-02-02: `check()` is disabled since it fails since it runs no test.
# check() {
#   cd "${srcdir}/${_pkname}"
#   printf '%s\n' " --> testing ..."
#   pytest
# }

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  _docfiles=(
    README.md
  )
  _docdirs=()
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    LICENSE
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docdir}")"
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -D -v -m644 "docs/build/man/${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile[@]}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
