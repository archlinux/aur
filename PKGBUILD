# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

pkgname=datadog-agent
pkgver=7.35.2
_agentrel=1
pkgrel=1
pkgdesc='Datadog Agent: collect metrics and events from your systems and apps'
arch=('x86_64' 'aarch64')
license=('Apache')
url='https://datadoghq.com'
depends=('sysstat' 'libxcrypt-compat')
options=('!strip')
source=("${pkgname}-${pkgver}-${_agentrel}-Release::https://apt.datadoghq.com/dists/stable/Release"
        "${pkgname}-${pkgver}-${_agentrel}-Release.sig::https://apt.datadoghq.com/dists/stable/Release.gpg"
        'datadog-agent.sysusers'
        'datadog-agent.tmpfiles')
source_x86_64=("${pkgname}-${pkgver}-${_agentrel}-amd64-Packages::https://apt.datadoghq.com/dists/stable/7/binary-amd64/Packages"
               "https://apt.datadoghq.com/pool/d/da/datadog-agent_${pkgver}-${_agentrel}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-${_agentrel}-arm64-Packages::https://apt.datadoghq.com/dists/stable/7/binary-arm64/Packages"
                "https://apt.datadoghq.com/pool/d/da/datadog-agent_${pkgver}-${_agentrel}_arm64.deb")
validpgpkeys=('D75CEA17048B9ACBF186794B32637D44F14F620E') # Datadog, Inc. Master key (2020-09-08) <package+masterkey@datadoghq.com>
sha512sums=('SKIP'
            'SKIP'
            '20cacea9611af70f3a8802dfd545313cf40fe7784cc44555cfe50602676d624072caf3803193e23d38d9a24f5a2c2a7ee336f9a9ca87562326b21b5ed677032f'
            '2a3e873d88b8f3a5d90591f955894273eb28d0f9b352e54be4f1125d4229a8f1d7eece8bf6ad41b85ee194390821e9c851393fb36ac249069cfdf7470925ce21')
sha512sums_x86_64=('SKIP'
                   '131c8ff6f6bbf0aae63b1b2ebac6402e0a04de2064bc3720f9b5403e1629ec587adf0e848a31924010aa6c3df05f805726ee958d27165adc29eb34dd21a72515')
sha512sums_aarch64=('SKIP'
                    'c9dd8abe850897904fce04005839e954d23f1861dbf0d9f7335bd52515360aed52a402212124a83f48496cde222fee5d154993a53172778eec5fc059334eebf5')


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
    echo $(awk "/^SHA256/,/7\/binary-${archtoken}\/Packages\$/ {hash = \$1} END {print hash}" "${pkgname}-${pkgver}-${_agentrel}-Release") "${pkgname}-${pkgver}-${_agentrel}-${archtoken}-Packages" \
       > "${pkgname}-${pkgver}-${_agentrel}-${archtoken}-Packages.sha256"
    sha256sum -c "${pkgname}-${pkgver}-${_agentrel}-${archtoken}-Packages.sha256"

    # Validate the .deb
    echo $(pcregrep -A 20 -M "datadog-agent\nVersion: 1:${pkgver}-${_agentrel}" "${pkgname}-${pkgver}-${_agentrel}-${archtoken}-Packages" | grep ^SHA256 | awk '{print $2}') "${pkgname}_${pkgver}-${_agentrel}_${archtoken}.deb" \
        > "${pkgname}-${pkgver}-${_agentrel}_${archtoken}.deb.sha256"
    sha256sum -c "${pkgname}-${pkgver}-${_agentrel}_${archtoken}.deb.sha256"
}

package() {
    cd "${srcdir}"

    tar -xzf data.tar.gz -C "${pkgdir}"

    install -Dm644 "$srcdir"/datadog-agent.sysusers "$pkgdir"/usr/lib/sysusers.d/datadog-agent.conf
    install -Dm644 "$srcdir"/datadog-agent.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/datadog-agent.conf

    mv "${pkgdir}/lib/systemd" "${pkgdir}/usr/lib/"
    rmdir "${pkgdir}/lib"

    ln -sf /opt/datadog-agent/bin/agent/agent "${pkgdir}/usr/bin/datadog-agent"
}
