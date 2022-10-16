# Maintainer: dreieck

_pkgname=adhocspot-script
pkgname="${_pkgname}-git"
epoch=0
pkgver=20221016.01.r14.20221016.81f5146
pkgrel=2
pkgdesc="Bash script to easily configure your interface to share your internet connection and configure a DHCP and DNS and TFTP boot server to listen on it. IP, DHCP, DNS can be configured, and for WiFi interfaces also wireless mode and encryption."
url="https://gitlab.com/dreieckli/adhocspot-script"
arch=('any')
license=(
  'GPL3'
  'custom: craiyon.com'
)
groups=()
depends=(
  "bash"
  "dnsmasq"
  "iptables"
  "net-tools"
  "wireless_tools"
  "wpa_supplicant"
)
makedepends=(
  'git'
)
optdepends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=()
options=('emptydirs')
install='adhocspot-script.install'
source=(
  "${_pkgname}::git+https://gitlab.com/dreieckli/adhocspot-script.git"
  "adhocspot-script.install"
)
sha256sums=(
  'SKIP'
  "f05052583b9d7ba8215897bc621fea38d18fea20e1040fcbda4fd2ab76fc8867"
)

prepare() {
  chmod 755 "${srcdir}/${_pkgname}/adhocspot.sh" # So that pkgver() can execute it.
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(./adhocspot.sh --version)"
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

  _licdirbase="/usr/share/licenses/${pkgname}"
  _licdir="${pkgdir}/${_licdirbase}"
  _docdirbase="/usr/share/doc/${_pkgname}"
  _docdir="${pkgdir}/${_docdirbase}"
  _execdirbase='/usr/bin'
  _execdir="${pkgdir}/${_execdirbase}"
  # _rundirbase="/run/adhocspot"
  # _rundir="${pkgdir}/${_rundirbase}"

  install -v -D -m755 "adhocspot.sh" "${_execdir}/adhocspot.sh"
  install -v -D -m644 "README.md" "${_docdir}/README.md"
  install -v -D -m644 "logo.jpg" "${_docdir}/logo.jpg"
  install -v -D -m644 "COPYING.GPL3.txt" "${_licdir}/COPYING.GPL3.txt"
  install -v -D -m644 "logo.copyingnotice.txt" "${_licdir}/logo.copyingnotice.txt"
  # install -v -d -m755 "${_rundir}"
}
