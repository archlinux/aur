# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ddnsto-bin
pkgname=ddnsto-bin
_name=${pkgname%-bin}
pkgver=4.0.6
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
backup=('etc/ddnsto/config.yaml')
source=(
    "https://fw0.koolcenter.com/binary/ddnsto/${_name}-binary-${pkgver}.tar.gz"
    "ddnsto.service"
    "ddnsto@.service"
    "ddnstoctl"
    "${pkgname}.tmpfiles"
    "${pkgname}.sysusers"
    "${pkgname}.install"
)
sha256sums=('e6244ac8fd8930a023c77246a2baf0e7aa1adf0d4af9193b115ec60fbe8c41ce'
            '99d7c3c20776645a08de44062cea1b32fd37288e35d61821e90c45e132dd5f14'
            '3c1a8239e991a920dff7d6476ee4db0735103b3c0104f1d4f8ced3ccac59abe1'
            '4f172970d4acab26b73af58c5fd162b30b5f1af3b72cd9d812bff143118e99f4'
            '39e941e8901fd18083896a47176b0d8566da0b133607df506d261093f4660889'
            'b068dcd630d7ce9a3b0bf904340f9438572d84cd4c75ad49102a274a4be37dd6'
            'b8c91cac4ea55ac9753fa9a6786b223eebfba62f5d232ee8bfee3799f9f6f70a')
options=(!debug !strip)

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
        -e 's|/data|/var/lib/ddnsto|g' config.yaml
    install -vDm640 config.yaml -t ${pkgdir}/etc/ddnsto/
    install -vDm644 ${srcdir}/ddnsto.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vdm755 ${pkgdir}/var/log/ddnsto \
             ${pkgdir}/var/lib/ddnsto
    install -Dvm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/ddnsto.conf"
    install -Dvm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ddnsto.conf"
}
