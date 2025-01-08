# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pyname="loudify"
_pkgname="python-${_pyname}"
pkgname="${_pkgname}-git"
pkgver=1.0+5.r56.20250104.072ef65
pkgrel=1
pkgdesc="LoRa cloudified. This is a python package to run a GNU Radio flow graph in a client <-> broker <-> worker context. The idea behind this project is to get a Centralized Radio Access Network (CRAN) for LoRa."
arch=('any')
_githost='github.com'
_gituser='martynvdijke'
url="https://${_githost}/${_gituser}/${_pyname}"
license=("MIT")
depends=(
  'python>=3.7'
  'python-coloredlogs>=15.0.1'
  'python-pyzmq>=22.1.0'
)
makedepends=(
  'git'
  'python-build'
  'python-flit-core>=3.3.0'
  'python-installer'
  'python-humanfriendly>=9.2'
  'python-setuptools>=62.4'
  'python-setuptools-scm>=6.0.1'
  'python-toml>=0.10.2'
  'python-wheel'
)
optdepends=()
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "${_pyname}=${pkgver}" # It installs a file into `/usr/bin`.
  "${_pyname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pyname}"
)

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_pyname}.git"
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

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  _docfiles=(
    "${srcdir}/git.log"
    CHANGELOG.md
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
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
