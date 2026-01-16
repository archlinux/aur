# Maintainer: taotieren <admin@taotieren.com>

pkgbase=wyc
pkgname=wyc
pkgver=3.0
pkgrel=9
pkgdesc="网云穿最便捷的端口映射"
license=('LicenseRef-scancode-commercial-license')
url="https://wangyunchuan.com"
arch=($CARCH)
options=(!strip !debug)
depends=(
    sh
)
makedepends=(libarchive)
provides=(${pkgname} ${pkgname}-bin)
conflicts=(${pkgname} ${pkgname}-bin)
replaces=()
# backup=(etc/wangyunchuan/)
install=${pkgname}.install
source=(
    "wangyunchuan@.service"
    "wyc-generate-token-config"
    "wangyunchuan.tmpfiles"
    "wangyunchuan.sysusers"
    "${pkgname}.install"
    #     "LICENSE::https://wangyunchuan.com/agreement"
    "LICENSE.txt"
    "${pkgname}-x86_64-${pkgver}::https://api.wangyunchuan.com/app/cms/linux/app_download?cpuArch=x86&osBit=64&type=app"
    "${pkgname}-aarch64-${pkgver}::https://api.wangyunchuan.com/app/cms/arm/app_download?cpuArch=ARM&osBit=64&type=app"
)
sha256sums=('5ebc2e66eaa59ac4b9a6f3a4400fea0820b9e76dec01330596f3dcca9f2ce21f'
            'd5ef7e9f68fad164fbfbd04935ebcdd6034e21d5b258381c5489ff6d6bba4d27'
            '34990ee4d0f935b0f97f2107fa65a63b9aad8f01fc6aac8f927b8cb4bb56981b'
            '1f64b0ebd17ccbf69024e62622816474800f07049a5a5bc85ede142a0ea77523'
            '191dbb445f2d9f4cf0461ca09cb4458e2070d5011e5b0b5a8153789feb8f9892'
            '3f3715937f9e3ae47d4deac0faef7b9072df4048083410454c6dc561688e5824'
            '00529da711eb6b2cc1a1c25dcbcae6307088059aad427383bd38d138f13029ab'
            'a53ad0268f50ed19f996de00d40977b3bd9c070cefeb8d23568ea16b61d43309')
noextract=()

package() {
    if [ "$CARCH" == "aarch64" ]; then
        msg2 "Install for arm64"
        install -vDm755 ${srcdir}/${pkgname}-${CARCH}-${pkgver} ${pkgdir}/usr/bin/${pkgname}
    elif [ "$CARCH" == "x86_64" ]; then
        msg2 "Install for x64"
        install -vDm755 ${srcdir}/${pkgname}-${CARCH}-${pkgver} ${pkgdir}/usr/bin/${pkgname}
    else
        msg2 "Unsupported architectures"
    fi

    install -vDm755 ${srcdir}/wyc-generate-token-config -t ${pkgdir}/usr/bin/
    install -vDm644 ${srcdir}/wangyunchuan@.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vdm755 ${pkgdir}/etc/wangyunchuan \
        ${pkgdir}/var/log/wangyunchuan
    install -Dvm644 "${srcdir}/wangyunchuan.sysusers" "${pkgdir}/usr/lib/sysusers.d/wangyunchuan.conf"
    install -Dvm644 "${srcdir}/wangyunchuan.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/wangyunchuan.conf"
    install -vDm644 ${srcdir}/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
