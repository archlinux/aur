# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgbase='frp'
pkgbase='frp-bin'
pkgname=('frpc-bin' 'frps-bin')
pkgver=0.52.3
pkgrel=1
pkgdesc="A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
arch=('x86_64' 'i686' 'arm' 'aarch64')
license=('Apache')
url="https://github.com/fatedier/frp"
install='frp.install'
depends=('glibc')

source_x86_64=("${_pkgbase}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_amd64.tar.gz")
source_arm=("${_pkgbase}-${pkgver}-linux-arm.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_arm.tar.gz")
source_aarch64=("${_pkgbase}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_arm64.tar.gz")
source=(frp{s,c}.{service,toml,ini})

sha256sums=('432ae1e890b852cd2805ef73ab3f5fa7f9ec2ebf8503b9408d84eb191cf74b7f'
            '92940111a801ad43d5e619e84d101cd868ba77f84bf9ce956f3156704a9e0601'
            '383f78b5cf4d99aaabb7ad10cde526df8433c7878b59dff9b489518565a8f635'
            'e395753f3ac1155ddd9906596d89fddb6c837b63040a13a84f4b9213df0ebd6a'
            'e8ee6afc0ece32b6a883ae933838d9de42ebbb0b708a5516156e03f6bb4868d8'
            '383f78b5cf4d99aaabb7ad10cde526df8433c7878b59dff9b489518565a8f635')
sha256sums_x86_64=('5e041b19ba9ca6a5255679b353099946065edfdf951d807db2587fa8c95b1447')
sha256sums_arm=('46b6b8e83ccbbbc2e639c852dae9a41e79f8523d444fe39f9d8f7cc5e7661081')
sha256sums_aarch64=('a249c503a622599ba68330f323de22a457e058157cb8e38cd3e59581993c03d2')

packaging() {
	declare -A ARCH_MAP
	ARCH_MAP=([x86_64]='amd64' [i686]='386' [arm]='arm' [aarch64]='arm64')

	_srcdir="${srcdir}/${_pkgbase}_${pkgver}_linux_${ARCH_MAP[$CARCH]}"

	install -Dm755 "${_srcdir}/${1}" "${pkgdir}/usr/bin/${1}"

	install -Dm644 "${_srcdir}/${1}".toml "${pkgdir}/etc/frp/${1}_full.toml"
	install -Dm640 "${srcdir}/${1}.toml" "${pkgdir}/etc/frp/${1}.toml"
	install -Dm640 "${srcdir}/${1}.ini" "${pkgdir}/etc/frp/${1}.ini"

	install -Dm644 "${srcdir}/${1}".service "${pkgdir}/usr/lib/systemd/system/${1}".service
}

package_frpc-bin() {
	pkgdesc="$pkgdesc (Client)"
	provides=("${pkgname//-bin/}")
	conflicts=("${pkgname//-bin/}")
	backup=("etc/frp/${pkgname//-bin/}"{{,_full}.toml,{,_full}.ini})

	packaging "${pkgname//-bin/}"
	install -dm755 "$pkgdir/etc/frp/frpc.d/"
}

package_frps-bin() {
	pkgdesc="$pkgdesc (Server)"
	provides=("${pkgname//-bin/}")
	conflicts=("${pkgname//-bin/}")
	backup=("etc/frp/${pkgname//-bin/}"{{,_full}.toml,{,_full}.ini})

	packaging "${pkgname//-bin/}"
}
