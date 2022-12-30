# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgbase='frp'
pkgbase='frp-bin'
pkgname=('frpc-bin' 'frps-bin')
pkgver=0.46.0
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
sha256sums_x86_64=('754d66a918d3550c83e670a458f66954eec0521d6e76a20dd0a865992ad1b55e')
sha256sums_i686=('c87ffc18bfa386cf946156f91fb8649a0cdbcd762550a0b8ab1f4774cb608455')
sha256sums_arm=('3cd7ec9209b973520d47d784a09a368bfb9e2bb195f3c543ae5311720249e315')
sha256sums_aarch64=('62044b03a7bccb7e8f8f4f691f34838cd1160a643c0bb06ca8489e78d2d65897')

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
