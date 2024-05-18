# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="futex-test"
_executablename="${_gitname}"
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=r10.20240517.65f2fcc
pkgrel=1
pkgdesc="Programme that tests if the kernel supports futex calls supported by some wine version for increased gaming performance."
arch=(
  'aarch64'
  'riscv'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
_githost='github.com'
_gituser='weirddan455'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("MIT")
depends=(
  'glibc'
)
makedepends=(
  'git'
)
optdepends=()
checkdepends=()
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

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  gcc ${CFLAGS} -o "${_executablename}" "${_executablename}.c"
}

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> installing binary ..."
  install -Dvm755 -t "${pkgdir}/usr/bin" "${_executablename}"

  _docfiles=(
    "${srcdir}/git.log"
    README.md
  )
  _licensefiles=(
    LICENSE
  )

  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_docfile}"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
