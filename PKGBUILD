# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_projectname="untangle"
_pkgname="${_projectname}"
pkgname="${_pkgname}-git"
pkgver=0.1.r1.20181128.210085c
pkgrel=1
pkgdesc="Tool to extract files from DoubleFine LPAK bundle as found in Day of the Tentacle Remastered."
arch=(
  'any'
)

_gitprotocol='git+https'
_githost='github.com'
_gituser='fleger'
_giturl="${_githost}/${_gituser}/${_projectname}.git"
url="http://${_githost}/${_gituser}/${_projectname}"
license=("MPL-2.0")
depends=(
  'python>=3.7'
)
makedepends=(
  'git'
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

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm755 untangle.py "${pkgdir}/usr/bin/untangle"

  _docfiles=(
    "${srcdir}/git.log"
    README.md
  )
  _licensefiles=(
    "${srcdir}/${_pkgname}/LICENSE"
  )

  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
