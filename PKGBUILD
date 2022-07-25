# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgbase='frp'
pkgbase='frp-bin'
pkgname=('frpc-bin' 'frps-bin')
pkgver=0.44.0
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
source=(frp{s,c}.service)

sha256sums=('7ebef660643b119529a69381ea26ea947efba30dc4e7f806508364a774d491e4'
            '0fa8904ad2c3c0abe496f3906d9f4ebd1a0c06f339f80d0aaca46599eee750cc')
sha256sums_x86_64=('45f65dafd172f3a5e05eabf3d4efbb954c92a88851a027f79c19f61a10b78287')
sha256sums_i686=('ce18273ca20bd38c567b0355ca2c85575651b39249294969daa51e568077a872')
sha256sums_arm=('ad151125bd46fb8abf11f2a4347c7c85e102bb0e6128c69962c8d6bf9a71fca6')
sha256sums_aarch64=('f5acd6dd3812f30ed6a2a2a864231563a962d4ff09c64d21be106db6f8806af8')

packaging() {
  declare -A ARCH_MAP
  ARCH_MAP=( [x86_64]='amd64' [i686]='386' [arm]='arm' [aarch64]='arm64' )

  _srcdir="${srcdir}/${_pkgbase}_${pkgver}_linux_${ARCH_MAP[$CARCH]}"

  install -Dm755 "${_srcdir}/${1}" "${pkgdir}/usr/bin/${1}"

  install -Dm644 "${_srcdir}/${1}".ini "${pkgdir}/etc/frp/${1}".ini
  install -Dm644 "${_srcdir}/${1}"_full.ini "${pkgdir}/etc/frp/${1}"_full.ini

  install -Dm644 "${srcdir}/${1}".service  "${pkgdir}/usr/lib/systemd/system/${1}".service
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
