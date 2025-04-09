# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pyname="pywuffs"
_pkgname="python-${_pyname}"
pkgname="${_pkgname}-git"
pkgver=2.0.1.r41.20250405.2e62bc5
pkgrel=1
pkgdesc="This project is intended to enable using Wuffs the Library from Python code."
arch=(
  'i686'
  'x86_64'
  'armv6h'
  'armv7h'
  'aarch64'
  'pentium4'
  'riscv64'
)
_githost='github.com'
_gituser='dev0x13'
url="https://${_githost}/${_gituser}/${_pyname}"
license=("MIT")
depends=(
  'gcc-libs'
  'glibc'
  'python>=3'
  #'libwuffs.so'
)
makedepends=(
  'gcc'
  'gcc-libs'
  'glibc'
  'git'
  'pybind11'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'wuffs-lib'
)
optdepends=(
  'python-pysimplegui'
)
checkdepends=()
provides=(
  "${_pyname}=${pkgver}"
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pyname}"
  "${_pkgname}"
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
    README.md
  )
  _docdirs=(
    example
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
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

