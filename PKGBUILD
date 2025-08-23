# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Maintainer: Focshole - contact me on AUR or through Github
pkgname=(crowdsec-firewall-bouncer-{iptables,nftables})
pkgbase=crowdsec-firewall-bouncer
pkgver=0.0.34
pkgrel=3
pkgdesc="Crowdsec bouncer written in golang for firewalls"
arch=('x86_64' 'aarch64')
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

source_x86_64=(
    "$pkgbase-$pkgver.tar.gz::https://github.com/crowdsecurity/cs-firewall-bouncer/releases/download/v${pkgver}/${pkgbase}-linux-amd64.tgz"
)
source_aarch64=(
    "$pkgbase-$pkgver.tar.gz::https://github.com/crowdsecurity/cs-firewall-bouncer/releases/download/v${pkgver}/${pkgbase}-linux-arm64.tgz"
)

sha256sums_x86_64=('8b07e08fb35a90b33eb2403eb93966679b39adb42c9cd03882de66cdf19a949f')
sha256sums_aarch64=('41899de18ad928e89de26a6fcd46ae8c7cb9a3b95369e850335106db0bf727aa')

    
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
