# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgbase='frp'
pkgbase='frp-bin'
pkgname=('frpc-bin' 'frps-bin')
pkgver=0.52.1
pkgrel=2
pkgdesc="A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
arch=('x86_64' 'i686' 'arm' 'aarch64')
license=('Apache')
url="https://github.com/fatedier/frp"
install='frp.install'
depends=('glibc')

source_x86_64=("${_pkgbase}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_amd64.tar.gz")
source_arm=("${_pkgbase}-${pkgver}-linux-arm.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_arm.tar.gz")
source_aarch64=("${_pkgbase}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_arm64.tar.gz")
source=(frp{s,c}.service)

sha256sums=('c65641186333c213a6a82b7522b5f62165b7a3427c8216dde889364834c226c1'
            '7b1c397c3a6555fd6c04ee35589a40504ec5c0536a63ced5652d6fdea396a1f5')
sha256sums_x86_64=('136cc6be28c798b2493875f498b5956a876c24cdbd028773aa9194c8bd846442')
sha256sums_arm=('a7626329b690c269d640555033e156a55cffb967f11556eb782ff130d0ad7982')
sha256sums_aarch64=('aff5412e89e7164b5083909f2b5a81d8edaa644a3bb6ef696843a6ee0d129fc3')

packaging() {
	declare -A ARCH_MAP
	ARCH_MAP=([x86_64]='amd64' [i686]='386' [arm]='arm' [aarch64]='arm64')

	_srcdir="${srcdir}/${_pkgbase}_${pkgver}_linux_${ARCH_MAP[$CARCH]}"

	install -Dm755 "${_srcdir}/${1}" "${pkgdir}/usr/bin/${1}"

	install -Dm640 "${_srcdir}/${1}".toml -t "${pkgdir}/etc/frp/"

	install -Dm644 "${srcdir}/${1}".service "${pkgdir}/usr/lib/systemd/system/${1}".service
}

package_frpc-bin() {
	pkgdesc="$pkgdesc (Client)"
	provides=("${pkgname//-bin/}")
	conflicts=("${pkgname//-bin/}")
	backup=("etc/frp/${pkgname//-bin/}"{.toml,{,_full}.ini})

	packaging "${pkgname//-bin/}"
}

package_frps-bin() {
	pkgdesc="$pkgdesc (Server)"
	provides=("${pkgname//-bin/}")
	conflicts=("${pkgname//-bin/}")
	backup=("etc/frp/${pkgname//-bin/}"{.toml,{,_full}.ini})

	packaging "${pkgname//-bin/}"
}
