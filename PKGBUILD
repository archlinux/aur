# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgbase='frp'
pkgbase='frp-bin'
pkgname=('frpc-bin' 'frps-bin')
pkgver=0.47.0
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
sha256sums_x86_64=('d7a7a6085fa6a9f8de0ae2c221c1ef110b9afc2a0122a058482ef3974d031ac0')
sha256sums_i686=('71a0f3137f02da4116ea2b7d134c38be86a1229cffb0b1dac4469b561ea35985')
sha256sums_arm=('00ffd863c32645660a29db758db4ea89f7c3eb616b3488cceca55345d8a5d11d')
sha256sums_aarch64=('f1dc0436b7f9f3f5c5d404cf5fb4a7319ff1cc22a06a687672020af620693f70')

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
