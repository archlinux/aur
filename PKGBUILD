# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pyname="map-tiles-downloader"
_gitname="map-tiles-downloader"
_pkgname="${_pyname}"
pkgname="${_pkgname}-git"
pkgver=1.3.3.r70.20251009.e16451b
pkgrel=3
pkgdesc="OpenStreetMap and thunderforest map tiles batch downloader: For selectable regions, within a bounding box, or around points of a KML file. Downloads the generic x/y/z.png(jpg) map tile structure to a directory tree."
groups=('openstreetmap')
arch=(
  'any'
)
_githost='github.com'
_gituser='tekk'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("CC-BY-4.0")
depends=(
  'python>=3.9'
  'python-aiohttp>=3.9'
  'python-tqdm>=4.65'
  'python-fastkml>=0.12'
  'python-aiofiles>=23.1'
  'python-questionary>=2.0'
  'python-lxml>=5.0'
  'python-geonamescache>=2.0'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=61.0.0'
  'python-wheel'
)
optdepends=()
## `check()` disabled since it needs the software to be already installed.
# checkdepends=(
#   'python-anyio'
#   'python-hypothesis'
#   'python-pluggy'
#   'python-pytest'
#   'python-pytest-asyncio>=0.23'
#   'python-pytest-cov'
# )
provides=(
  "${_pkgname}=${pkgver}"
  "mt-downloader=${pkgver}"
  "mt-downloader-git=${pkgver}"
  "python-${_pyname}=${pkgver}"
  "python-${_pyname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "mt-downloader"
  "python-${_pyname}"
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

  _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' pyproject.toml  | head -n1 | awk -F= '{print $2}' | tr -d \'\"[[:space:]])"
  #_ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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

## `check()` disabled since it needs the software to be already installed.
# check() {
#   cd "${srcdir}/${_pkgname}"
#   printf '%s\n' " --> testing ..."
#   pytest
# }

package() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  ## The package installs both `/usr/bin/mt-downloader` and `/usr/bin/map-tiles-downloader`, which are identical. So, remove one and make it a symlink instead:
  rm -fv "${pkgdir}/usr/bin/mt-downloader"
  ln -svr "${pkgdir}/usr/bin/map-tiles-downloader" "${pkgdir}/usr/bin/mt-downloader"

  _docfiles=(
    "${srcdir}/git.log"
    README.md
    map-tiles-downloader.spec
  )
  _docdirs=(
    img
  )
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

