# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>
# Maintainer: Ashley Watson <ashley.watson@proton.me>

pkgname=datadog-agent
pkgver=7.75.2
_agentrel=1
pkgrel=2
pkgdesc='Datadog Agent: collect metrics and events from your systems and apps'
arch=('x86_64' 'aarch64')
license=('Apache')
url='https://datadoghq.com'
depends=('sysstat' 'libxcrypt-compat')
makedepends=('pcre')
options=('!strip')
install='datadog-agent.install'
source=("${pkgname}-${pkgver}-${_agentrel}-Release::https://apt.datadoghq.com/dists/stable/Release"
        "${pkgname}-${pkgver}-${_agentrel}-Release.sig::https://apt.datadoghq.com/dists/stable/Release.gpg"
        'datadog-agent.sysusers'
        'datadog-agent.tmpfiles')
source_x86_64=("${pkgname}-${pkgver}-${_agentrel}-amd64-Packages::https://apt.datadoghq.com/dists/stable/7/binary-amd64/Packages"
               "https://apt.datadoghq.com/pool/d/da/datadog-agent_${pkgver}-${_agentrel}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-${_agentrel}-arm64-Packages::https://apt.datadoghq.com/dists/stable/7/binary-arm64/Packages"
                "https://apt.datadoghq.com/pool/d/da/datadog-agent_${pkgver}-${_agentrel}_arm64.deb")
# Public key is published here: https://s3.amazonaws.com/public-signing-keys/DATADOG_APT_KEY_CURRENT.public
validpgpkeys=('5F1E256061D813B125E156E8E6266D4AC0962C7D') # Datadog, Inc. Master Key (2023-04-20) <package+masterkey@datadoghq.com>
sha512sums=('SKIP'
            'SKIP'
            '20cacea9611af70f3a8802dfd545313cf40fe7784cc44555cfe50602676d624072caf3803193e23d38d9a24f5a2c2a7ee336f9a9ca87562326b21b5ed677032f'
            '8878b8118bb980f43d8686dc87f516768c300bb7d05788bc3a8961aa4009e118b5a22a8f5c9759fd9bcd906243ef10bf06c4c4cf27c62b4d1a1e04bca274f78b')
sha512sums_x86_64=('SKIP'
                   '4b872413df638a1ced22ed71a134e6047d59421c43ecf2de84f67b37b1916f6be601e330024644b6642d81db3d632587823901d5d0f4bd56cad1755f0a97d656')
sha512sums_aarch64=('SKIP'
                    'e70c101f9be9e00f057c47626a1a269f0c55723c16cee847c4565d59c609b96ea60f033752e796c988d0ec3dff695f00e018b84d554334cd154ec6e965a4eda5')

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

    tar -xf data.tar.xz -C "${pkgdir}"

    install -Dm644 "$srcdir"/datadog-agent.sysusers "$pkgdir"/usr/lib/sysusers.d/datadog-agent.conf
    install -Dm644 "$srcdir"/datadog-agent.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/datadog-agent.conf

    ln -sf /opt/datadog-agent/bin/agent/agent "${pkgdir}/usr/bin/datadog-agent"
}
