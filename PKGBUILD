# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ddnsto-bin
pkgname=ddnsto-bin
_name=${pkgname%-bin}
pkgver=4.2.0
pkgrel=1
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
    "https://fw0.koolcenter.com/binary/ddnsto/linux-binary/${_name}-binary-${pkgver}.tar.gz"
    "ddnsto.service"
    "${pkgname}.tmpfiles"
    "${pkgname}.sysusers"
    "${pkgname}.install"
)
sha256sums=('be066e16409da44cee04607c02e2ebdb9e4a89c2b2c0de2a03981d169ed5b3df'
            '99d7c3c20776645a08de44062cea1b32fd37288e35d61821e90c45e132dd5f14'
            '57f54bcf6013b0a2fe03923d4119a36cb8c6584f70b07dbd6d0c1d31f4fe8d72'
            'b068dcd630d7ce9a3b0bf904340f9438572d84cd4c75ad49102a274a4be37dd6'
            '113b1efa3502b9a62272cdf3f747f9ef39f452829e9f079b3975086d233f25aa')
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
