# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname="asf"
pkgver="2.1.3.1"
pkgrel=2
pkgdesc="Steam cards farmer."
arch=('any')
url="https://github.com/JustArchi/ArchiSteamFarm"
license=('Apache')
depends=('mono')
changelog=changelog
backup=('opt/asf/config/ASF.json' 'var/lib/asf/ASF.json')
install=${pkgname}.install
source=("https://github.com/JustArchi/ArchiSteamFarm/releases/download/${pkgver}/ASF.zip"
        "${pkgname}.sh"
        "${pkgname}-config.sh"
        "${pkgname}.service"
        "${pkgname}-user.service")
sha256sums=('43db7c2729551fcb7f546a473f6fd90ab7ca296f641f55334b240f3c39109f16'
            'a5d0324c029efb1f99264e787fea26ad53953b4df59bf642bca1ffabad4027f5'
            '63b8d4718e8cc61016ef415ff418e6180102b077315f5ce77bfcab9c03433565'
            '580845c04b2add412f9bc642c429a5dad274d5f637da42dc95ba10993cab7825'
            'c50da9f236788ebce411ff2db524279b22a9077b5d69f4262a2cfe307152c2a1')

package() {
    install -d -m 755 "${pkgdir}/opt/${pkgname}"
    install -d -m 755 "${pkgdir}/var/lib/${pkgname}"
    cp -dp --no-preserve=ownership *.exe "${pkgdir}/opt/${pkgname}"
    cp -dp --no-preserve=ownership config/* "${pkgdir}/var/lib/${pkgname}"

    install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m755 "${srcdir}/${pkgname}-config.sh" "${pkgdir}/usr/bin/${pkgname}-config"
    install -D -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m644 "${srcdir}/${pkgname}-user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    # disable auto-updates and version checks
    sed -i 's/"AutoUpdates": true,/"AutoUpdates": false,/g' ${pkgdir}/var/lib/asf/ASF.json
    sed -i 's/"UpdateChannel": 1,/"UpdateChannel": 0,/g' ${pkgdir}/var/lib/asf/ASF.json
}
