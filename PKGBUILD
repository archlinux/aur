# Maintainer: tuberry

_srcname='ss-tproxy'
pkgname=ss-tproxy-git
pkgver=r836.0f45dd0
pkgrel=2
pkgdesc='A rudimentary script for building SS/SSR/V2Ray/Socks5 transparent proxy environments'
arch=('i686' 'x86_64')
url="https://github.com/zfl9/${_srcname}"
license=('AGPL3')
depends=('bash')
makedepends=('git')
provides=("${_srcname}")
conflicts=("${_srcname}")
optdepends=('iptables: support IPv4/IPv6 tproxy rules'
            'ipset: store IP lists of gfwlist/chnlist or global/chnroute mode'
            'dnsmasq: provides DNS server for gfwlist/chnlist mode'
            'chinadns-ng: provides DNS server for chnroute mode'
            'dns2tcp: convert DNS query from udp to tcp, require zfl9/dns2tcp in tcponly mode'
            'shadowsocks-libev: provides ss-redir')
backup=(etc/${_srcname}/${_srcname}.conf
        etc/${_srcname}/gfwlist.ext
        etc/${_srcname}/ignlist.ext)
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd ${_srcname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
    cd ${_srcname}
    sed -i 's/usr\/local\/bin/usr\/bin/g' ${_srcname}.service
}

package() {
    cd ${_srcname}
    install -Dm755 ${_srcname} ${pkgdir}/usr/bin/${_srcname}
    install -dm755 ${pkgdir}/etc/${_srcname}
    install -Dm644 ${_srcname}.conf gfwlist* chnroute* ignlist* ${pkgdir}/etc/${_srcname}
    install -Dm644 ${_srcname}.service ${pkgdir}/usr/lib/systemd/system/${_srcname}.service # 可选，安装 service 文件
}
