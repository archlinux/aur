# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

pkgname=datadog-agent
pkgver=7.27.0
_agentrel=1
pkgrel=1
pkgdesc='Datadog Agent: collect metrics and events from your systems and apps'
arch=('x86_64' 'aarch64')
license=('Apache')
url='https://datadoghq.com'
depends=('sysstat')
options=('!strip')
source=("${pkgname}-${pkgver}-${_agentrel}-Release::https://apt.datadoghq.com/dists/stable/Release"
        "${pkgname}-${pkgver}-${_agentrel}-Release.sig::https://apt.datadoghq.com/dists/stable/Release.gpg"
        'datadog-agent.sysusers'
        'datadog-agent.tmpfiles')
source_x86_64=("${pkgname}-${pkgver}-${_agentrel}-amd64-Packages::https://apt.datadoghq.com/dists/stable/7/binary-amd64/Packages"
               "https://apt.datadoghq.com/pool/d/da/datadog-agent_${pkgver}-${_agentrel}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-${_agentrel}-arm64-Packages::https://apt.datadoghq.com/dists/stable/7/binary-arm64/Packages"
                "https://apt.datadoghq.com/pool/d/da/datadog-agent_${pkgver}-${_agentrel}_arm64.deb")
validpgpkeys=('A2923DFF56EDA6E76E55E492D3A80E30382E94DE') # Datadog, Inc <package@datadoghq.com>
sha512sums=('SKIP'
            'SKIP'
            '20cacea9611af70f3a8802dfd545313cf40fe7784cc44555cfe50602676d624072caf3803193e23d38d9a24f5a2c2a7ee336f9a9ca87562326b21b5ed677032f'
            '2a3e873d88b8f3a5d90591f955894273eb28d0f9b352e54be4f1125d4229a8f1d7eece8bf6ad41b85ee194390821e9c851393fb36ac249069cfdf7470925ce21')
sha512sums_x86_64=('SKIP'
                   'e0634d345c868866cf03643bd06841373dad7233d048c6ef0092553842888ace3d3fbf443388f53d639c7e988a3600661a6a1d62f9162ae3286452c7d4c3dc52')
sha512sums_aarch64=('SKIP'
                    '52293f53fcea34d830277c3586443384d201808d8a259bb28a81aefdade9ae350bf42bb93fa00f5ce336f6edaf237f84213ce06bc7d36ff73868fc5bc55f8782')

prepare() {
    case "$CARCH" in
        x86_64)
            archtoken="amd64"
            ;;
        aarch64)
            archtoken="arm64"
            ;;
        *)
            echo "unknown arch."
            exit 1
            ;;
    esac

    # Validate hashes from the PGP signed "Release" file
    echo $(awk "/^SHA256/,/7\/binary-${archtoken}\/Packages\$/ {hash = \$1} END {print hash}" ${pkgname}-${pkgver}-${_agentrel}-Release) ${pkgname}-${pkgver}-${_agentrel}-${archtoken}-Packages \
       > "${pkgname}-${pkgver}-${_agentrel}-${archtoken}-Packages.sha256"
    sha256sum -c "${pkgname}-${pkgver}-${_agentrel}-${archtoken}-Packages.sha256"

    # Validate the .deb
    echo $(pcregrep -A 20 -M "datadog-agent\nVersion: 1:${pkgver}-${_agentrel}" ${pkgname}-${pkgver}-${_agentrel}-${archtoken}-Packages | grep ^SHA256 | awk '{print $2}') ${pkgname}_${pkgver}-${_agentrel}_${archtoken}.deb \
        > "${pkgname}-${pkgver}-${_agentrel}_${archtoken}.deb.sha256"
    sha256sum -c "${pkgname}-${pkgver}-${_agentrel}_${archtoken}.deb.sha256"
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
