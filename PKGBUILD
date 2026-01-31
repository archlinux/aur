# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pyname="pygeoif"
_gitname="${_pyname}"
_pkgname="python-${_pyname}"
pkgname="${_pkgname}-git"
pkgver=1.6.0+47.r1029.20260128.196efdc
pkgrel=1

pkgdesc="A Python library providing a GeoJSON-like protocol for geo-spatial (GIS) vector data."
groups=()
arch=(
  'any'
)
_githost='github.com'
_gituser='cleder'
url="https://pygeoif.readthedocs.io/"
license=("LGPL-2.1-or-later")
depends=(
  'python>=3.9'
  'python-typing_extensions'
)

makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=61.2'
  'python-wheel'
)
optdepends=()
## `check()` disabled because they fail if the computer is too slow, see https://github.com/cleder/pygeoif/issues/333.
# checkdepends=(
#   'python-anyio'
#   'python-hypothesis'
#   'python-more-itertools'
#   'python-pluggy'
#   'python-pytest'
#   'python-pytest-cov'
# )
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' pyproject.toml  | head -n1 | awk -F= '{print $2}' | tr -d \'\"[[:space:]])"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation
}

## `check()` disabled because they fail if the computer is too slow, see https://github.com/cleder/pygeoif/issues/333.
# check() {
#   cd "${srcdir}/${_pkgname}"
#   printf '%s\n' " --> testing ..."
#   pytest
# }

package() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  _docfiles=(
    "${srcdir}/git.log"
    README.rst
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

