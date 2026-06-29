# Maintainer: dreieck

_servicename='latemount'
_upstreamname="${_servicename}-openrc"
_pkgname="${_upstreamname}"
pkgname="${_pkgname}-git"
pkgver=0.5.r3.20260629.1d658ce
pkgrel=1
pkgdesc="OpenRC init script that mounts specified mountpoints at later time in the boot process."
url="https://codeberg.org/dreieck/${_upstreamname}"
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
backup=("etc/conf.d/${_servicename}")
source=(
  "${_upstreamname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_upstreamname}"
  git log . > git.log
}

pkgver() {
  cd "${srcdir}/${_upstreamname}"

  _ver="$(grep -E '^[[:space:]]*VERSION=' init.d/"${_servicename}" | tail -n1 | awk -F= '{print $2}' | tr -d \"\'[[:space:]])"
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
  cd "${srcdir}/${_upstreamname}"

  install -Dvm755 -t "${pkgdir}"/etc/init.d init.d/"${_servicename}"
  install -Dvm644 -t "${pkgdir}"/etc/conf.d conf.d/"${_servicename}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
