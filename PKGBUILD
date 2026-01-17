# Maintainer: taotieren <admin@taotieren.com>

pkgbase=wyc
pkgname=wyc
pkgver=7
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
    "wycctl"
    "wangyunchuan.tmpfiles"
    "wangyunchuan.sysusers"
    "${pkgname}.install"
    #     "LICENSE::https://wangyunchuan.com/agreement"
    "LICENSE.txt"
    "${pkgname}-x86_64-${pkgver}::https://api.wangyunchuan.com/app/cms/linux/app_download?cpuArch=x86&osBit=64&type=app"
    "${pkgname}-aarch64-${pkgver}::https://api.wangyunchuan.com/app/cms/arm/app_download?cpuArch=ARM&osBit=64&type=app"
)
sha256sums=('4f5bb3311e4b0eb3b64cd022feb6ebaebf4b886e1b01ba3e6965aa9d03f8e236'
            '6f88b845cfe875e6316a1679934a541548e23adf1947b41e73de376761ceee8b'
            '34990ee4d0f935b0f97f2107fa65a63b9aad8f01fc6aac8f927b8cb4bb56981b'
            '1f64b0ebd17ccbf69024e62622816474800f07049a5a5bc85ede142a0ea77523'
            'a26b4a1ce6f1e59b5a9e0eb87880e5fb8e1472ad302c749a954d1d923a0e941a'
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

    install -vDm755 ${srcdir}/wycctl -t ${pkgdir}/usr/bin/
    install -vDm644 ${srcdir}/wangyunchuan@.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vdm755 ${pkgdir}/etc/wangyunchuan \
        ${pkgdir}/var/log/wangyunchuan
    install -Dvm644 "${srcdir}/wangyunchuan.sysusers" "${pkgdir}/usr/lib/sysusers.d/wangyunchuan.conf"
    install -Dvm644 "${srcdir}/wangyunchuan.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/wangyunchuan.conf"
    install -vDm644 ${srcdir}/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
