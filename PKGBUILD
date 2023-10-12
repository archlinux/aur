# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
pkgname=(crowdsec-firewall-bouncer-{iptables,nftables})
pkgbase=crowdsec-firewall-bouncer
pkgver=0.0.28
pkgrel=3
pkgdesc="Crowdsec bouncer written in golang for firewalls"
arch=('x86_64')
url="https://doc.crowdsec.net/docs/bouncers/firewall/"
license=('MIT')
depends=(crowdsec)
optdepends=(
    'systemd: running as a systemd service'
)
provides=(crowdsec-firewall-bouncer cs-firewall-bouncer)
conflicts=(cs-firewall-bouncer)
backup=(etc/crowdsec/bouncers/crowdsec-firewall-bouncer.yaml)
install=cs-firewall-bouncer.install
source=(
    cs-firewall-bouncer.install
    "$pkgbase-$pkgver.tar.gz::https://github.com/crowdsecurity/cs-firewall-bouncer/releases/download/v${pkgver}/${pkgbase}-linux-amd64.tgz"
)
sha256sums=('8c976fa05b0269c6b048b0ef68e38695b0864a7e8ae3064adba9cee787a0703f'
            'ce39dc3877ceed2827767f8a47277caa799f2a84f0cb9dc86c2fcbe64b2989c4')

prepare() {
    cd "$pkgbase-v$pkgver"
    export BIN='/usr/bin/crowdsec-firewall-bouncer'
    export CFG='/etc/crowdsec/bouncers'
    envsubst '$BIN,$CFG' <config/crowdsec-firewall-bouncer.service >crowdsec-firewall-bouncer.service
}

package_base() {
    export BACKEND=${pkgname##$pkgbase-}
    install -Dm600 <(envsubst '$BACKEND' <config/crowdsec-firewall-bouncer.yaml) "${pkgdir}/etc/crowdsec/bouncers/crowdsec-firewall-bouncer.yaml"
}

package_crowdsec-firewall-bouncer-iptables() {
    pkgdesc="$pkgdesc (iptables)"
    depends+=(iptables ipset)
    conflicts+=(crowdsec-firewall-bouncer-nftables)

    cd "$pkgbase-v$pkgver"
    package_base
    install -Dm644 crowdsec-firewall-bouncer.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm755 crowdsec-firewall-bouncer -t "${pkgdir}/usr/bin/"
}

package_crowdsec-firewall-bouncer-nftables() {
    pkgdesc="$pkgdesc (nftables)"
    depends+=(nftables)
    conflicts+=(crowdsec-firewall-bouncer-iptables)

    cd "$pkgbase-v$pkgver"
    package_base
    install -Dm644 crowdsec-firewall-bouncer.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm755 crowdsec-firewall-bouncer -t "${pkgdir}/usr/bin/"
}
