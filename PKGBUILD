# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgbase='frp'
pkgbase='frp-bin'
pkgname=('frpc-bin' 'frps-bin')
pkgver=0.52.1
pkgrel=5
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
sha256sums_x86_64=('136cc6be28c798b2493875f498b5956a876c24cdbd028773aa9194c8bd846442')
sha256sums_arm=('a7626329b690c269d640555033e156a55cffb967f11556eb782ff130d0ad7982')
sha256sums_aarch64=('aff5412e89e7164b5083909f2b5a81d8edaa644a3bb6ef696843a6ee0d129fc3')

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
