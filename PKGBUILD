# Maintainer: Dwi Mulia Mokoginta <dwi-mulia-mokoginta@protonmail.com>

_pkgname=minisforum-platform
_modname=minisforum_platform
pkgname=minisforum-platform-dkms
pkgver=0.2
pkgrel=1
pkgdesc="Linux platform & hardware monitoring driver for Minisforum UM790 Pro (Venus series) with in-kernel CPPC QoS and EC fan control"
arch=('x86_64')
url="https://github.com/malwareslayer/minisforum-platform"
license=('GPL-2.0-or-later')
depends=('dkms')
provides=("${_modname}")
conflicts=("${_modname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('78683b442250c278670e7a5cd8a4e4f603cba3be403b1b331bd83cc51a581faa')

prepare() {
  cd "${_pkgname}-v${pkgver}"

  # Align dkms.conf and Makefile version strings with pkgver
  sed -i "s/PACKAGE_VERSION=\".*\"/PACKAGE_VERSION=\"${pkgver}\"/" dkms.conf
  sed -i "s/VERSION := .*/VERSION := ${pkgver}/" Makefile
}

package() {
  cd "${_pkgname}-v${pkgver}"

  local _destdir="${pkgdir}/usr/src/${_modname}-${pkgver}"
  install -dm755 "${_destdir}"

  # Install module build files
  install -Dm644 Makefile "${_destdir}/Makefile"
  install -Dm644 dkms.conf "${_destdir}/dkms.conf"

  # Install source files
  install -dm755 "${_destdir}/src"
  install -Dm644 src/*.[ch] "${_destdir}/src/"

  # Documentation and license per Arch Linux packaging standard
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
