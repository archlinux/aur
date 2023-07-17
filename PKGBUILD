# Maintainer: dreieck

_pkgname=linux-terminal-battery-status
pkgname="${_pkgname}-nosystemd-git"
pkgver=20230717.01.r17.20230717.339e6a6
pkgrel=1
pkgdesc="Prints information about system batteries and power supplies to the terminal, optionally also from devices connected via KDE Connect."
url="https://gitlab.com/dreieckli/linux-terminal-battery-status"
license=(GPL3)
arch=(any)
depends=(
  'bash'
  'coreutils'
  'gawk'
)
optdepends=(
  'acpi: To display remaining battery time.'
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

  install -Dvm755 'linux-terminal-battery-status.sh' "${pkgdir}/usr/bin/linux-terminal-battery-status"

  install -Dvm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.md"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.md" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING.md"
}
