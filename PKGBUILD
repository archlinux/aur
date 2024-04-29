# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_executablename=screenlayout
_pkgname=arandr-screenlayout-launch-cli
pkgname="${_pkgname}-git"
pkgver=20240429.01.r5.g3ae1bde
pkgrel=2
pkgdesc="Terminal programme to apply a setting from a saved screenlayout from ARandR."
url="https://codeberg.org/dreieck/arandr-screenlayout-launch-cli"
license=(
  'GPL-3.0-or-later'
  'LicenseRef-Custom'
)
arch=(any)
depends=(
  'bash'
)
optdepends=(
  'arandr: To generate the screenlayouts this software applies.'
)
makedepends=(
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
  "screenlayout=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "screenlayout"
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(bash "${_executablename}" --version)"
  _rev="$(git rev-list --count HEAD)"
  # _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")" # Don't process date since the upstream version also has some notion of date.
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    # printf '%s' "${_ver}.r${_rev}.${_date}.g${_hash}"
    printf '%s' "${_ver}.r${_rev}.g${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm755 -t "${pkgdir}/usr/bin" "${_executablename}"

  install -Dvm644 'screenlayout-bash-completion' "${pkgdir}/usr/share/bash-completion/completions/${_executablename}"
  install -Dvm644 'logo.png' "${pkgdir}/usr/share/pixmaps/${_executablename}.png"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md git.log
  ln -svr "${pkgdir}/usr/share/pixmaps/${_executablename}.png" "${pkgdir}/usr/share/doc/${_pkgname}/logo.png"
  ln -svr "${pkgdir}/usr/share/doc/${_pkgname}" "${pkgdir}/usr/share/doc/${_executablename}"

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE LICENSE-logo TERMS-craiyon.com.txt
  for _licensefile in LICENSE LICENSE-logo TERMS-craiyon.com.txt; do
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
