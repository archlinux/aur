# Maintainer: dreieck

_pkgname=zram-init-openrc
pkgname="${_pkgname}-git"
pkgver=13.3.r36.20260228.66ef54e
_pkgmajorver="$(awk -F. '{print $1}' <<< "${pkgver}")"
_pkgnextmajorver="$(("${_pkgmajorver}" + 1))"
_pkgminorver="$(awk -F. '{print $2}' <<< "${pkgver}")"
pkgrel=1
pkgdesc="OpenRC init script for 'zram-init'."
url='https://github.com/vaeth/zram-init'
license=('GPL-2.0-only')
arch=('any')
depends=(
  "zram-init>=${_pkgmajorver}"
  "zram-init<${_pkgnextmajorver}"
)
makedepends=("git")
optdepends=("openrc: To make use of this script.")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=('!emptydirs')
backup=('etc/conf.d/zram-init')
source=(
  "zram-init::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/zram-init/openrc"
  git log . > git.log
}

pkgver() {
  cd "${srcdir}/zram-init/openrc"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _lastcommit="$(git rev-list HEAD -- . | head -n1)"
  _rev="$(git rev-list --count HEAD -- .)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad" .)"
  _hash="$(git rev-parse --short "${_lastcommit}")"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}


package() {
  cd "${srcdir}/zram-init/openrc"

  install -Dvm755 -t "${pkgdir}"/etc/init.d init.d/zram-init
  install -Dvm644 -t "${pkgdir}"/etc/conf.d conf.d/zram-init

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log
}
