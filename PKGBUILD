# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ddnsto-bin
pkgname=ddnsto-bin
_name=${pkgname%-bin}
pkgver=4.0.5
pkgrel=1
pkgdesc="DDNSTO is a stable, fast and easy-to-use intranet penetration tool"
arch=($CARCH)
url="https://web.ddnsto.com"
license=('LicenseRef-ddnsto')
provides=(${pkgbase%-bin})
conflicts=(${pkgbase%-bin})
depends=(
    sh
)
makedepends=()
optdepends=()
source=(
    "https://fw0.koolcenter.com/binary/ddnsto/${_name}-binary-${pkgver}.tar.gz"
    "ddnsto@.service"
    "ddnstoctl"
    "${pkgname}.tmpfiles"
    "${pkgname}.sysusers"
    "${pkgname}.install"
)
sha256sums=('9efc10af8260bd2e7eff74a78cb4df7a89c73396d40193d9f27ac961966f6ac9'
            '3c1a8239e991a920dff7d6476ee4db0735103b3c0104f1d4f8ced3ccac59abe1'
            '4f172970d4acab26b73af58c5fd162b30b5f1af3b72cd9d812bff143118e99f4'
            'bf67280d0f715c964510b8fdbcbccdd8776641306f34deb1cfb5b60930009a8a'
            'b068dcd630d7ce9a3b0bf904340f9438572d84cd4c75ad49102a274a4be37dd6'
            'b8c91cac4ea55ac9753fa9a6786b223eebfba62f5d232ee8bfee3799f9f6f70a')
options=(!debug !strip)

package() {
    cd "${srcdir}/${_name}-binary-${pkgver}/"
    if [ ${CARCH} = "x86_64" ]; then
        install -vDm755 ${_name}.x86_64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "aarch64" ]; then
        install -vDm755 ${_name}.aarch64 ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "mipsel" ]; then
        install -vDm755 ${_name}.mipsel ${pkgdir}/usr/bin/${_name}
    elif [ ${CARCH} = "armv7h" ]; then
        install -vDm755 ${_name}.arm ${pkgdir}/usr/bin/${_name}
    fi
    install -vDm755 ${srcdir}/ddnstoctl -t ${pkgdir}/usr/bin/
    install -vDm644 ${srcdir}/ddnsto@.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vdm755 ${pkgdir}/etc/ddnsto \
        ${pkgdir}/var/log/ddnsto
    install -Dvm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/ddnsto.conf"
    install -Dvm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ddnsto.conf"
}
