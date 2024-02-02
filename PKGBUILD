# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>

_pkgbase='frp'
pkgbase='frp-bin'
pkgname=('frpc-bin' 'frps-bin')
pkgver=0.54.0
pkgrel=1
pkgdesc="A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
arch=('x86_64' 'arm' 'aarch64')
license=('Apache')
url="https://github.com/fatedier/frp"
install='frp.install'
depends=('glibc')

source_x86_64=("${_pkgbase}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_amd64.tar.gz")
source_arm=("${_pkgbase}-${pkgver}-linux-arm.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_arm.tar.gz")
source_aarch64=("${_pkgbase}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_arm64.tar.gz")
source=(frp{s,c}.{service,toml,ini})

sha256sums=('e7fbdde67049147607a3ab0d9d39b5bb8b52430c40d78dd35f2285ecf24f6aae'
            '92940111a801ad43d5e619e84d101cd868ba77f84bf9ce956f3156704a9e0601'
            'd54cc115ee6f0588c1f9f7fa1f473eb590ee421f93be5660e4627e6dfa570fc3'
            'fb83d77bcd7f7c2aad29c89fdcf251552486886d39557db64dd6c09c39cf2903'
            'a342c7baf72252273f06597ce1aa465ee22dfbea51b842c2ca09c0ff019f7746'
            '42b8aa9e5589d157e8f6209c426ced70a2d079ca4040cd4469f458c081fc1bee')
sha256sums_x86_64=('13102618f84a2efa07a90733d9bae72e48b897c29f4df4b38bdacebb99517e52')
sha256sums_arm=('0ccc051693da612b7c4eed265598d3c8878019cb21e6ec9e3869f94b93e6ca80')
sha256sums_aarch64=('a3f01a59bca7cb330bf680019595bbbf5f8167494fab4c46eaaf836fdc3a1902')

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
