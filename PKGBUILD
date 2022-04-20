# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgbase='frp'
pkgbase='frp-bin'
pkgname=('frpc-bin' 'frps-bin')
pkgver=0.41.0
pkgrel=1
pkgdesc="A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
arch=('x86_64' 'i686' 'arm' 'aarch64')
license=('Apache')
url="https://github.com/fatedier/frp"
depends=('glibc')

source_x86_64=("${_pkgbase}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_pkgbase}-${pkgver}-linux-386.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_386.tar.gz")
source_arm=("${_pkgbase}-${pkgver}-linux-arm.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_arm.tar.gz")
source_aarch64=("${_pkgbase}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('f6b96c46d8395d08ae91d5a19d55f8c9f19d512207612a89ca4c79df0c2f3c5d')
sha256sums_i686=('43534e7300dc4de9b8dc796f15ff168eb017fd8e895ad73b183ce71dbe0b9beb')
sha256sums_arm=('21d0ed799e2d277a941a92a68b69a1ad4cdfe058fbdc6cb6141fff2c81421c57')
sha256sums_aarch64=('9a56f4e3bf3a276c7be0b2f180a4d6ffbad1258dc09fe2d6637666dee9c840f6')

packaging() {
  declare -A ARCH_MAP
  ARCH_MAP=( [x86_64]='amd64' [i686]='386' [arm]='arm' [aarch64]='arm64' )

  _srcdir="${srcdir}/${_pkgbase}_${pkgver}_linux_${ARCH_MAP[$CARCH]}"

  install -Dm755 "${_srcdir}/${1}" "${pkgdir}/usr/bin/${1}"

  install -Dm644 "${_srcdir}/${1}".ini "${pkgdir}/etc/frp/${1}".ini
  install -Dm644 "${_srcdir}/${1}"_full.ini "${pkgdir}/etc/frp/${1}"_full.ini

  install -Dm644 "${_srcdir}/systemd/${1}".service  "${pkgdir}/usr/lib/systemd/system/${1}".service
  install -Dm644 "${_srcdir}/systemd/${1}"@.service  "${pkgdir}/usr/lib/systemd/system/${1}"@.service
}

package_frpc-bin() {
  pkgdesc="$pkgdesc (Client)"
  provides=("${pkgname//-bin}")
  conflicts=("${pkgname//-bin}")
  backup=("etc/frp/${pkgname//-bin}"{,_full}.ini)

  packaging "${pkgname//-bin}"
}

package_frps-bin() {
  pkgdesc="$pkgdesc (Server)"
  provides=("${pkgname//-bin}")
  conflicts=("${pkgname//-bin}")
  backup=("etc/frp/${pkgname//-bin}"{,_full}.ini)

  packaging "${pkgname//-bin}"
}
