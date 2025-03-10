# Maintainer: taotieren <admin@taotieren.com>

pkgbase=wyc
pkgname=wyc
pkgver=2.65.4
pkgrel=10
pkgdesc="网云穿最便捷的端口映射"
license=('LicenseRef-scancode-commercial-license')
url="https://xiaomy.net/"
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
    "${pkgname}-x86_64-${pkgver}::https://down.xiaomy.net/linux/wyc_linux_64"
    "${pkgname}-aarch64-${pkgver}::https://down.xiaomy.net/linux/wyc_linux_arm"
)
sha256sums=('2cb2001f207a8bb54a871346f03e464ecd5b08eefcfb0e464eca37c4f599d1f4'
            'a97150926add15686b59d7aceda85b8cfae64aede84ccd31c97bc72dc4df3288'
            '0e944ff4a0982059d9e4828b120b81b1d61de53fb6fa73fc95562396aba87c71'
            '083cb2c4067200d8d428802678ed5a1a417c7474b07fdd81719c7509d326863a'
            '53c8f4da34ac71de834d7d0768c13ec043d22f4cd6a1c5da61fc910a39a3ecee'
            '3f3715937f9e3ae47d4deac0faef7b9072df4048083410454c6dc561688e5824'
            'c299049774e59ee7a12645a461f571ace0f1b09dcca1b2707a49475ef0d18694'
            'f161bc9c3d2cf3a7b12ba2c8b6a981e33cb2bd87b1b816b83cc14190c82290fa')
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
