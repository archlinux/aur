# Maintainer: Maria <maria@kuuro.net>

_pkgname=dropdeck
pkgname=${_pkgname}-git
pkgver=r7.f8e18f4
pkgrel=1
pkgdesc="Phone-style pull-down panel for Linux desktop (Quickshell)"
arch=('x86_64' 'aarch64')
url="https://github.com/maria-rcks/dropdeck"
license=('Apache-2.0')
depends=(
  'quickshell'
  'networkmanager'
  'rfkill'
  'brightnessctl'
  'wireplumber'
  'playerctl'
  'bluez-utils'
  'systemd'
)
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=(
  "${_pkgname}::git+https://github.com/maria-rcks/dropdeck.git"
  "dropdeck.service"
  "dropdeck@.service"
  "dropdeck.sh"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  cp -a "${srcdir}/${_pkgname}/." "${pkgdir}/usr/share/${_pkgname}/"

  rm -rf \
    "${pkgdir}/usr/share/${_pkgname}/.git" \
    "${pkgdir}/usr/share/${_pkgname}/packaging"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/dropdeck.sh" "${pkgdir}/usr/bin/dropdeck"

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -dm755 "${pkgdir}/usr/lib/systemd/user"
  install -m644 "${srcdir}/dropdeck.service" "${pkgdir}/usr/lib/systemd/user/dropdeck.service"

  install -dm755 "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/dropdeck@.service" "${pkgdir}/usr/lib/systemd/system/dropdeck@.service"
}
