# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

pkgname=datadog-agent
pkgver=6.12.1
_agentrel=1
pkgrel=1
pkgdesc='Datadog Agent: collect metrics and events from your systems and apps'
arch=('x86_64')
license=('Apache')
url='https://datadoghq.com'
depends=('sysstat')
options=('!strip')
source=("${pkgname}-${pkgver}-${_agentrel}-Release::https://apt.datadoghq.com/dists/stable/Release"
        "${pkgname}-${pkgver}-${_agentrel}-Release.sig::https://apt.datadoghq.com/dists/stable/Release.gpg"
        "${pkgname}-${pkgver}-${_agentrel}-Packages::https://apt.datadoghq.com/dists/stable/6/binary-amd64/Packages"
        "https://apt.datadoghq.com/pool/d/da/datadog-agent_${pkgver}-${_agentrel}_amd64.deb"
        'datadog-agent.sysusers'
        'datadog-agent.tmpfiles')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '244934687759460867444b40e6572e31e507c00b998604d7961093fa366ff880787297e99c41fb8573aa258e503521c344b23a4a25be99c27fa10a4070a77682'
            '20cacea9611af70f3a8802dfd545313cf40fe7784cc44555cfe50602676d624072caf3803193e23d38d9a24f5a2c2a7ee336f9a9ca87562326b21b5ed677032f'
            '2a3e873d88b8f3a5d90591f955894273eb28d0f9b352e54be4f1125d4229a8f1d7eece8bf6ad41b85ee194390821e9c851393fb36ac249069cfdf7470925ce21')
validpgpkeys=('A2923DFF56EDA6E76E55E492D3A80E30382E94DE') # Datadog, Inc <package@datadoghq.com>

prepare() {
    # Validate hashes from the PGP signed "Release" file
    echo "$(grep 6/binary-amd64/Packages ${pkgname}-${pkgver}-${_agentrel}-Release | tail -n 2 | head -n 1 | awk '{print $1}') ${pkgname}-${pkgver}-${_agentrel}-Packages" \
        > "${pkgname}-${pkgver}-${_agentrel}-Packages.sha256"
    sha256sum -c "${pkgname}-${pkgver}-${_agentrel}-Packages.sha256"

    echo "$(grep datadog-agent -A 20 ${pkgname}-${pkgver}-${_agentrel}-Packages | grep SHA256 | tail -n 1 | awk '{print $2}') datadog-agent_${pkgver}-${_agentrel}_amd64.deb" \
        > "${pkgname}-${pkgver}-${_agentrel}.deb.sha256"
    sha256sum -c "${pkgname}-${pkgver}-${_agentrel}.deb.sha256"
}

package() {
    cd "${srcdir}"

    tar -xzf data.tar.gz -C "${pkgdir}"

    install -Dm644 "$srcdir"/datadog-agent.sysusers "$pkgdir"/usr/lib/sysusers.d/datadog-agent.conf
    install -Dm644 "$srcdir"/datadog-agent.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/datadog-agent.conf

    mv ${pkgdir}/lib/systemd ${pkgdir}/usr/lib/
    rmdir ${pkgdir}/lib

    ln -sf /opt/datadog-agent/bin/agent/agent "${pkgdir}/usr/bin/datadog-agent"
}
