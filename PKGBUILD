# Maintainer: taotieren <admin@taotieren.com>

pkgbase=wyc
pkgname=wyc
pkgver=3.0
pkgrel=1
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
# backup=(etc/wyc/)
install=${pkgname}.install
source=(
    "${pkgname}@.service"
    "wyc-generate-token-config"
    "${pkgname}.tmpfiles"
    "${pkgname}.sysusers"
    "${pkgname}.install"
    #     "LICENSE::https://xiaomy.net/agreement"
    "LICENSE.txt"
    "${pkgname}-x86_64-${pkgver}::https://api.wangyunchuan.com/app/cms/linux/app_download?cpuArch=x86&osBit=64&type=app"
    "${pkgname}-aarch64-${pkgver}::https://api.wangyunchuan.com/app/cms/arm/app_download?cpuArch=ARM&osBit=64&type=app"
)
sha256sums=('5514409e682dc06dc1161156b54ab53cd948673ef6776ed73f57930cea8c0475'
            'a97150926add15686b59d7aceda85b8cfae64aede84ccd31c97bc72dc4df3288'
            '0e944ff4a0982059d9e4828b120b81b1d61de53fb6fa73fc95562396aba87c71'
            '083cb2c4067200d8d428802678ed5a1a417c7474b07fdd81719c7509d326863a'
            '53c8f4da34ac71de834d7d0768c13ec043d22f4cd6a1c5da61fc910a39a3ecee'
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
    install -vDm644 ${srcdir}/${pkgname}@.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vdm755 ${pkgdir}/etc/${pkgname} \
        ${pkgdir}/var/log/${pkgname}
    install -Dvm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dvm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -vDm644 ${srcdir}/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
