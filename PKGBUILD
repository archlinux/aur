# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_projectname="xasm"
_pkgname="${_projectname}"
pkgname="${_pkgname}-git"
pkgver=3.2.1+6.r148.20240609.f5903fb
pkgrel=2
pkgdesc="6502 cross-assembler with original syntax extensions. By default it generates binaries for Atari 8-bit computers."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)

_gitprotocol='git+https'
_githost='github.com'
_gituser='pfusik'
_giturl="${_githost}/${_gituser}/${_projectname}.git"
url="http://${_githost}/${_gituser}/${_projectname}"
license=("LicenseRef-Poetic")
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'asciidoc'
  'dmd'
  'git'
  'patch'
)
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()

source=(
  "${_pkgname}::${_gitprotocol}://${_giturl}"
  "COPYING.txt"
)
sha256sums=(
  'SKIP'
  '0ac0b64e62cae3eef68466d603e86350503763edd86135265c9a4e06ee6f690d'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^xasm-||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> installing ..."
  make DESTDIR="${pkgdir}" prefix="/usr" install

  _docfiles=(
    "${srcdir}/git.log"
    README.md
  )
  _licensefiles=(
    "${srcdir}/COPYING.txt"
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
