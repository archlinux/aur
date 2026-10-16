# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ddnsto-bin
pkgname=(ddnsto-bin ddnsto-micro-bin)
_name=${pkgname%-bin}
pkgver=4.2.6
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
depends=()
makedepends=()
optdepends=()
source=(
    "https://fw0.koolcenter.com/binary/ddnsto/linux-binary/${_name}-standard-${pkgver}.tar.gz"
    "https://fw0.koolcenter.com/binary/ddnsto/linux-binary/${_name}-micro-${pkgver}.tar.gz"
    "ddnsto.service"
    "ddnsto.tmpfiles"
    "ddnsto.sysusers"
    "ddnsto-bin.install"
    "ddnsto-micro-bin.install"
)
sha256sums=('4521d0b2ffeb35c4f539380c604c5d40577cb03d3938c98064324c098c276a3b'
            '90b0531d6d76edbb5d2e76f87bef5b2fba6a23d521d679dabc2f02fe91f82ee2'
            '99d7c3c20776645a08de44062cea1b32fd37288e35d61821e90c45e132dd5f14'
            '57f54bcf6013b0a2fe03923d4119a36cb8c6584f70b07dbd6d0c1d31f4fe8d72'
            'b068dcd630d7ce9a3b0bf904340f9438572d84cd4c75ad49102a274a4be37dd6'
            '113b1efa3502b9a62272cdf3f747f9ef39f452829e9f079b3975086d233f25aa'
            '113b1efa3502b9a62272cdf3f747f9ef39f452829e9f079b3975086d233f25aa')
options=(!debug !strip emptydirs)

package_ddnsto-bin() {
    pkgdesc+=" - Go"
    provides=(${pkgbase%-bin})
    conflicts=(${pkgbase%-bin})
    backup=('etc/ddnsto/config.yaml')
    install=${pkgname}.install

    cd "${srcdir}/${_name}-standard-${pkgver}/"
    local _bin
    case "${CARCH}" in
        x86_64)  _bin="${_name}.x86_64"   ;;
        aarch64) _bin="${_name}.aarch64"  ;;
        mipsel)  _bin="${_name}.mipsel"   ;;
        armv7h)
            if [ -f "${_name}.arm32hf" ]; then
                _bin="${_name}.arm32hf"
            else
                _bin="${_name}.arm"
            fi
            ;;
        *)
            error "不支持的架构：${CARCH}"
            return 1
            ;;
    esac

    ./"${_bin}" example-config > config.yaml
    install -vDm755 "${_bin}" "${pkgdir}/usr/bin/${_name}"
  
    sed -i -e 's|/tmp/logs|/var/log/ddnsto|g' \
        -e 's|/data|/srv/ddnsto|g' \
        config.yaml
    
    install -vDm640 config.yaml -t ${pkgdir}/etc/ddnsto/
    install -vDm644 ${srcdir}/ddnsto.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vdm755 ${pkgdir}/var/log/ddnsto \
            ${pkgdir}/var/lib/ddnsto

    install -vdm775 ${pkgdir}/srv/ddnsto

    install -Dvm644 "${srcdir}/ddnsto.sysusers" "${pkgdir}/usr/lib/sysusers.d/ddnsto.conf"
    install -Dvm644 "${srcdir}/ddnsto.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ddnsto.conf"
}

package_ddnsto-micro-bin() {
    pkgdesc+=" - Rust"
    provides=(${pkgbase%-bin})
    conflicts=(${pkgbase%-bin})
    backup=('etc/ddnsto/config.yaml')
    install=${pkgname}.install

    cd "${srcdir}/${_name}-micro-${pkgver}/"
    local _bin
    case "${CARCH}" in
        x86_64)  _bin="${_name}.x86_64"   ;;
        aarch64) _bin="${_name}.aarch64"  ;;
        mipsel)  _bin="${_name}.mipsel"   ;;
        armv7h)
            if [ -f "${_name}.arm32hf" ]; then
                _bin="${_name}.arm32hf"
            else
                _bin="${_name}.arm"
            fi
            ;;
        *)
            error "不支持的架构：${CARCH}"
            return 1
            ;;
    esac

    ./"${_bin}" example-config > config.yaml
    install -vDm755 "${_bin}" "${pkgdir}/usr/bin/${_name}"
  
    sed -i -e 's|/tmp/logs|/var/log/ddnsto|g' \
        -e 's|/data|/srv/ddnsto|g' \
        config.yaml
    
    install -vDm640 config.yaml -t ${pkgdir}/etc/ddnsto/
    install -vDm644 ${srcdir}/ddnsto.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vdm755 ${pkgdir}/var/log/ddnsto \
            ${pkgdir}/var/lib/ddnsto

    install -vdm775 ${pkgdir}/srv/ddnsto

    install -Dvm644 "${srcdir}/ddnsto.sysusers" "${pkgdir}/usr/lib/sysusers.d/ddnsto.conf"
    install -Dvm644 "${srcdir}/ddnsto.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ddnsto.conf"
}
