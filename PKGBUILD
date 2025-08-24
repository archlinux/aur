# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pyname="aardwolf"
_pkgname="python-${_pyname}"
pkgname="${_pkgname}-git"
pkgver=0.2.13.r148.20250819.5d44d39
pkgrel=1
pkgdesc="Asynchronous RDP protocol implementation for python."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'armv8h'
  'i686'
  'x86_64'
)
_githost='github.com'
_gituser='skelsec'
url="https://${_githost}/${_gituser}/${_pyname}"
license=("MIT")
depends=(
  'gcc-libs'
  'glibc'
  'python>=3.7'
  'python-unicrypto>=0.0.10'
  'python-asyauth>=0.0.13'
  'python-asysocks'
  'python-tqdm'
  'python-colorama'
  'python-asn1crypto'
  'python-asn1tools'
  'python-bitstruct' # Needed by 'python-asn1tools', but there it was forgotten, so we place it here for now.
  'python-pyperclip>=1.8.2'
  'python-arc4>=0.3.0' # faster than cryptodome
  'python-pillow>=9.0.0'
)
makedepends=(
  'cython'
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=62.4'
  'python-setuptools-rust>=1.5.2'
  'rust'
)
optdepends=(
  'python-pyqt5'
)
checkdepends=()
provides=(
  "ardpscan=${pkgver}"
  "${_pkgname}=${pkgver}"
  "${_pyname}=${pkgver}" # It installs a file into `/usr/bin`.
  "${_pyname}-git=${pkgver}"
)
conflicts=(
  "ardpscan"
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
  export CARGO_HOME="${srcdir}/cargo"

  git log > "${srcdir}/git.log"

  cd aardwolf/utils/rlers
  cargo fetch -v
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' setup.cfg | tail -n1 | sed -E -e 's|^[^=]*=[[:space:]]*||' -e 's|,.*$||' | tr -d \'\")"
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
  export CARGO_HOME="${srcdir}/cargo"

  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"

  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  _docfiles=(
    "${srcdir}/git.log"
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

