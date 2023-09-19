# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_projectname="virtualearthos"
_pkgname="marble-maps-${_projectname}"
pkgname="${_pkgname}-git"
pkgver=r5.20230919.44cb270
pkgrel=1
pkgdesc='Microsoft Maps for the Marble desktop globe.'
arch=(
  'any'
)

_gitprotocol='git+https'
_githost="gitlab.com"
_gituser="marble-restricted-maps"
_giturl="${_githost}/${_gituser}/${_projectname}.git"
url="http://${_githost}/${_gituser}/${_projectname}"
license=("custom: unknown.")
depends=()
optdepends=()
makedepends=(
  'git'
)
checkdepends=()
provides=(
  "${_pkgname}"
  "marble-maps-bing"
)
conflicts=(
  "${_pkgname}"
  "marble-restricted-maps-git<=latest"
)
replaces=()

source=(
  "${_projectname}::${_gitprotocol}://${_giturl}"
  "license-info.txt"
)
sha256sums=(
  'SKIP'
  '956222372d7993efa4584827bb57e72fc693a5df4eadcb22ed88f96c79bf0a50'
)

prepare() {
  cd "${srcdir}/${_projectname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_projectname}"

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

package() {
  cd "${srcdir}/${_projectname}"

  printf '%s\n' " --> installing ..."
  umask 002
  install -d -v -m755    "${pkgdir}/usr/share/marble/data/maps/earth/${_projectname}"
  cp -rv              *  "${pkgdir}/usr/share/marble/data/maps/earth/${_projectname}"/

  _docfiles=(
    "${srcdir}/git.log"
  )
  _licensefiles=(
    "${srcdir}/license-info.txt"
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
