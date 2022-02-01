# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgbase='frp'
pkgbase='frp-bin'
pkgname=('frpc-bin' 'frps-bin')
pkgver=0.39.0
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

sha256sums_x86_64=('b1dc5923bfb2c9d0d1e271e20cce3615f8d23d276e376d9c566dc5400f14282d')
sha256sums_i686=('09e451ce640afddb9ba25ed619bf2b26b8d080dbf3d09a3ac22f4d365d7832d3')
sha256sums_arm=('466fba9c2e3bb99aaaa0041443a360a4fef5ccbb869e995b8f60dc0a3ef70e08')
sha256sums_aarch64=('05cea2ca577a0dc7a1b8e6393547442174c1035818791f2a4e784471ab9dfcf0')

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
