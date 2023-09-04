# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgbase='frp'
pkgbase='frp-bin'
pkgname=('frpc-bin' 'frps-bin')
pkgver=0.51.3
pkgrel=2
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

sha256sums=('0227f1026980d66c943eda5980d6ed3bcdd90bedbfe0db493c187c2a4df031e2'
            '7b1c397c3a6555fd6c04ee35589a40504ec5c0536a63ced5652d6fdea396a1f5')
sha256sums_x86_64=('3fabb19b2157709cb6baea755513f38b2d5674539b54f7853454c48c5a9f22bf')
sha256sums_i686=('cf873001de9c33445213818c5844992e1a3a02486bd3defce556b95e9b0f4af0')
sha256sums_arm=('f300f69fe05b47e3b3e571a1fd83c7c0f7d69667d50a78ccbaa551bda3078169')
sha256sums_aarch64=('2e1a85c3cfa7cbbcb8747f53de4d7c913cd8ace7475988d823ca0e30bdcfa44e')

packaging() {
	declare -A ARCH_MAP
	ARCH_MAP=([x86_64]='amd64' [i686]='386' [arm]='arm' [aarch64]='arm64')

	_srcdir="${srcdir}/${_pkgbase}_${pkgver}_linux_${ARCH_MAP[$CARCH]}"

	install -Dm755 "${_srcdir}/${1}" "${pkgdir}/usr/bin/${1}"

	install -Dm640 "${_srcdir}/${1}"{,_full}.ini -t "${pkgdir}/etc/frp/"

	install -Dm644 "${srcdir}/${1}".service "${pkgdir}/usr/lib/systemd/system/${1}".service
}

package_frpc-bin() {
	pkgdesc="$pkgdesc (Client)"
	provides=("${pkgname//-bin/}")
	conflicts=("${pkgname//-bin/}")
	backup=("etc/frp/${pkgname//-bin/}"{,_full}.ini)

	packaging "${pkgname//-bin/}"
}

package_frps-bin() {
	pkgdesc="$pkgdesc (Server)"
	provides=("${pkgname//-bin/}")
	conflicts=("${pkgname//-bin/}")
	backup=("etc/frp/${pkgname//-bin/}"{,_full}.ini)

	packaging "${pkgname//-bin/}"
}
