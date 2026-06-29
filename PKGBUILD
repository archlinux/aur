# Maintainer: dreieck

_upstreamname='disable-faulty-usb'
_pkgname="${_upstreamname}-openrc"
pkgname="${_pkgname}-git"
pkgver=0.5.r4.20260629.906bcdc
pkgrel=1
pkgdesc="OpenRC init script that disables USB devices that fail to enumerate (according to 'dmesg')."
url='https://codeberg.org/dreieck/disable-faulty-usb'
license=('GPL-3.0-only')
arch=('any')
depends=()
makedepends=("git")
optdepends=("openrc: To make use of this script.")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=('!emptydirs')
backup=("etc/conf.d/${_upstreamname}")
source=(
  "${_upstreamname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_upstreamname}/openrc"
  git log . > git.log
}

pkgver() {
  cd "${srcdir}/${_upstreamname}/openrc"

  _ver="$(grep -E '^[[:space:]]*VERSION=' init.d/disable-faulty-usb | tail -n1 | awk -F= '{print $2}' | tr -d \"\'[[:space:]])"
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
  cd "${srcdir}/${_upstreamname}/openrc"

  install -Dvm755 -t "${pkgdir}"/etc/init.d init.d/"${_upstreamname}"
  install -Dvm644 -t "${pkgdir}"/etc/conf.d conf.d/"${_upstreamname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  ../LICENSE
}
