# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="edid-generator"
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=r30.20231120.476a016
pkgrel=2
pkgdesc="Hackerswork to generate an EDID binary file from given Xorg Modelines."
arch=(
  'any'
)
_githost='github.com'
_gituser='akatrevorjay'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("GPL-3.0-or-later")
depends=(
  'bash'      # Interpreter for the bundled script
  'binutils'  # for 'objcopy'
  'coreutils' # for 'cat' and 'mktemp'
  'dos2unix'
  'v4l-utils'
  'gcc'       # for 'cc'
  'make'      # to run the Makefile
  'zsh'       # Interpreter for the upstream script
)
makedepends=(
  'git'
)
optdepends=()
checkdepends=()
provides=(
  "${_pkgname}"
  "modeline2edid"
  "modeline2edid-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "modeline2edid"
)

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
  "edid-generator.sh"
)
sha256sums=(
  'SKIP'
  'c6c834ac652500b3fbb55b0bed7308badef0cfeb98e7d2e5990fa1695f79cfd0'
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

package() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' "    > installing ..."

  install -Dvm644 -t "${pkgdir}/usr/lib/${_pkgname}"   "hex" "Makefile" edid.S
  install -Dvm755 -t "${pkgdir}/usr/lib/${_pkgname}"   "modeline2edid"
  install -Dvm755  "${srcdir}/edid-generator.sh"         "${pkgdir}/usr/bin/edid-generator"
  ln -svr "${pkgdir}/usr/lib/${_pkgname}/modeline2edid"  "${pkgdir}/usr/bin/modeline2edid"

  _licensefiles=(
    LICENSE
  )
  printf '%s\n' "    > installing documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md EXAMPLE_MODELINES [0-9]*x[0-9]*.S "${srcdir}/git.log"

  printf '%s\n' "    > installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

