# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ddnsto-bin
pkgname=ddnsto-bin
_name=${pkgname%-bin}
pkgver=4.0.7
pkgrel=5
pkgdesc="DDNSTO is a stable, fast and easy-to-use intranet penetration tool"
arch=(
    x86_64
    aarch64
    armv7h
    mipsel
)
url="https://web.ddnsto.com"
license=('LicenseRef-ddnsto')
provides=(${pkgbase%-bin})
conflicts=(${pkgbase%-bin})
depends=()
makedepends=()
optdepends=()
backup=('etc/ddnsto/config.yaml')
install=${pkgname}.install
source=(
    "https://fw0.koolcenter.com/binary/ddnsto/${_name}-binary-${pkgver}.tar.gz"
    "ddnsto.service"
    "${pkgname}.tmpfiles"
    "${pkgname}.sysusers"
    "${pkgname}.install"
)
sha256sums=('d6a33d0878dcc41dc65fb65b62fbe655365f9839418ec71e0cf520dfcdab8a4d'
            '99d7c3c20776645a08de44062cea1b32fd37288e35d61821e90c45e132dd5f14'
            '57f54bcf6013b0a2fe03923d4119a36cb8c6584f70b07dbd6d0c1d31f4fe8d72'
            'b068dcd630d7ce9a3b0bf904340f9438572d84cd4c75ad49102a274a4be37dd6'
            'a20a25596e5f868c77024245b036661e466689e8afed6c858c14e6d9699206ba')
options=(!debug !strip emptydirs)

package() {
    cd "${srcdir}/${_name}-binary-${pkgver}/"
    if [ ${CARCH} = "x86_64" ]; then
        ./${_name}.x86_64 example-config > config.yaml
        install -vDm755 ${_name}.x86_64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "aarch64" ]; then
        ./${_name}.aarch64 example-config > config.yaml
        install -vDm755 ${_name}.aarch64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "mipsel" ]; then
        ./${_name}.mipsel example-config > config.yaml
        install -vDm755 ${_name}.mipsel ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "armv7h" ]; then
        ./${_name}.arm example-config > config.yaml
        install -vDm755 ${_name}.arm ${pkgdir}/usr/bin/${_name}
    fi
  
    sed -i -e 's|/tmp/logs|/var/log/ddnsto|g' \
        -e 's|/data|/srv/ddnsto|g' \
        config.yaml
    
    install -vDm640 config.yaml -t ${pkgdir}/etc/ddnsto/
    install -vDm644 ${srcdir}/ddnsto.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vdm755 ${pkgdir}/var/log/ddnsto \
            ${pkgdir}/var/lib/ddnsto

    install -vdm775 ${pkgdir}/srv/ddnsto

    install -Dvm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/ddnsto.conf"
    install -Dvm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ddnsto.conf"
}
