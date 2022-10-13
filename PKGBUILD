# Maintainer: tuberry

_srcname=ss-tproxy
pkgname=${_srcname}-git
pkgver=r854.45b53a2
pkgrel=1
pkgdesc='A rudimentary script for building SS/SSR/V2Ray/Socks5 transparent proxy environments'
arch=(i686 x86_64)
url=https://github.com/zfl9/${_srcname}
license=(AGPL3)
depends=(dnsmasq iptables ipset chinadns-ng)
makedepends=(git)
provides=(${_srcname})
conflicts=(${_srcname})
optdepends=('dns2tcp: convert DNS query from udp to tcp, require zfl9/dns2tcp in tcponly mode')
backup=(etc/${_srcname}/${_srcname}.conf
        etc/${_srcname}/gfwlist.ext
        etc/${_srcname}/ignlist.ext)
source=(git+${url})
sha512sums=(SKIP)

pkgver() {
    cd ${_srcname}
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
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
    install -Dm644 ${_srcname}.service ${pkgdir}/usr/lib/systemd/system/${_srcname}.service
}
