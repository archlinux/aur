# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_modulename="gpd-fan"
_gitname="${_modulename}-driver"
_githost="github.com"
_gituser="Cryolitia"
_pkgbase="${_gitname}-dkms"
pkgbase="${_pkgbase}-git"
_pkgname="${_pkgbase}"
pkgname="${pkgbase}"
groups=(
  "gpd"
)
pkgver=r38.20251015.6356608
_gpdfanspeedver="$("${startdir}"/gpdfanspeed --version)"
pkgrel=2
pkgdesc="Fan hwmon speed report and speed control driver for GPD Win Mini, GPD Win Max2 and GPD Win 4 laptops. Latest git checkout. Includes a command line control utility."
url="https://${_githost}/${_gituser}/${_gitname}"
arch=('any')
license=('GPL-2.0-or-later')
depends=(
  'dkms'
)
makedepends=(
  'git'
)
optdepends=(
  "bash: For 'gpdfanspeed' control utility."
)
provides=(
  "${_gitname}"
  "${_gitname}-git=${pkgver}"
  "${_pkgname}"
  "GPD-FAN-DRIVER"  # This means kernel-side support; packages providing kernel module, but also kernel packages which have that builtin, can set this.
  "gpdfanspeed=${_gpdfanspeedver}"
)
conflicts=(
  "${_gitname}"
  "${_pkgname}"
  "gpdfanspeed"
)
install="${_gitname}.install"
source=(
  "${_gitname}::git+${url}.git"
  "dkms.conf.in"
  "gpdfanspeed"
  "${install}"
)
sha256sums=(
  'SKIP'
  'f3f6f913c82b58f9e4811a04449a17ce88af57a0a4ba7fad05cfdbe3689b7863'  # dkms.conf.in
  '5ef1cf4e789bee5c6c63f07f1044d7d6150dc73e39462901ff09b7a4d9cd54a0'  # gpdfanspeed
  '52b499321ed838fa91a788e7fbf118a9cbeb9367e131aa924a6fa03afd20c922'  # $install
)

prepare() {
  cd "${srcdir}/${_gitname}"

  ## Generate GIT log
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_gitname}"

  # _ver="$(grep -E '^[[:space:]]*VERSION[[:space:]]*=' Makefile | tail -n1 | sed -E -e 's|^[[:space:]]*VERSION[[:space:]]*=[[:space:]]*||' -e 's|[[:space:]]*#.*$||')"
  # _upstreamrev="$(git describe --tags)"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine git commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  sed -E -e "s|%%VERSION%%|${pkgver}|g" dkms.conf.in > dkms.conf
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dvm755 -t "${pkgdir}/usr/bin"                        "${srcdir}/gpdfanspeed"

  umask 022
  install -Dvm644 -t "${pkgdir}/usr/src/${_gitname}-${pkgver}"  'gpd-fan.c' 'Makefile' "${srcdir}/dkms.conf"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_gitname}"      'README.md' "${srcdir}"/git.log
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  'LICENSE'
  ln -svr "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_gitname}/LICENSE"
}
