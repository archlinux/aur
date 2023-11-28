# Maintainer: dreieck

_pkgname=linux-terminal-battery-status
pkgname="${_pkgname}-git"
pkgver=20231128.06.r40.b58c130
pkgrel=1
pkgdesc="Prints information about system batteries and power supplies to the terminal, optionally also from devices connected via KDE Connect."
url="https://gitlab.com/dreieckli/linux-terminal-battery-status"
license=(
  'GPL3'
  'custom: CC_BY-SA_3.0'
)
arch=(any)
depends=(
  'bash'
  'bc'
  'coreutils'
  'gawk'
)
optdepends=(
  'acpi: To display remaining battery time.'
  'grep: To display remaining battery time.'
  'sed: To display remaining battery time.'
  'kdeconnect: To display information about devices connected via KDE Connect.'
  'qt5-tools: To display information about devices connected via KDE Connect.'
)
makedepends=(
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(bash linux-terminal-battery-status.sh --version)"
  _rev="$(git rev-list --count HEAD)"
  # _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")" # Don't process date since the upstream version also has some notion of date.
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    # printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
    printf '%s' "${_ver}.r${_rev}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm755 'linux-terminal-battery-status.sh' "${pkgdir}/usr/bin/linux-terminal-battery-status"
  install -Dvm644 'logo.svg' "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
  install -Dvm644 'logo.png' "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -Dvm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.md"
  install -Dvm644 COPYING.logo.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.logo.txt"
  install -Dvm644 logo_source.md "${pkgdir}/usr/share/licenses/${pkgname}/logo_source.md"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.md" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING.md"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.logo.txt" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING.logo.txt"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/logo_source.md" "${pkgdir}/usr/share/doc/${_pkgname}/logo_source.md"
}
