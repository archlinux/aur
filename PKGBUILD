# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname="asf"
pkgver="2.2.1.6"
pkgrel=1
pkgdesc="Steam cards farmer."
arch=('any')
url="https://github.com/JustArchi/ArchiSteamFarm"
license=('Apache')
depends=('mono')
changelog=changelog
backup=('opt/asf/config/ASF.json' 'var/lib/asf/config/ASF.json')
install=${pkgname}.install
source=("https://github.com/JustArchi/ArchiSteamFarm/releases/download/${pkgver}/ASF.zip"
        "${pkgname}.sh"
        "${pkgname}-config.sh"
        "${pkgname}.service"
        "${pkgname}-user.service"
        "${pkgname}.sysusers")
sha256sums=('99635dd142ea49f683aa7bbb81b42f219a09ea0a7de4bcaa682b4d89b77e73d2'
            'a5d0324c029efb1f99264e787fea26ad53953b4df59bf642bca1ffabad4027f5'
            '63b8d4718e8cc61016ef415ff418e6180102b077315f5ce77bfcab9c03433565'
            '39166dc6947b81ba9a3f60cc1f117198050fb5e4a7fb16a199adb2a77af2b205'
            '1948780515929c7fc8ffa6033bc79a55cbae375a1397326ef9dba0dfbe91cc56'
            'df5d5558e20a4164bc20f5b44e267baebb382c49d7289a2bbdd6c5544143182b')

package() {
    install -d -m 755 "${pkgdir}/opt/${pkgname}"
    install -d -m 755 "${pkgdir}/var/lib/${pkgname}/config"
    cp -dp --no-preserve=ownership *.exe "${pkgdir}/opt/${pkgname}"
    cp -dp --no-preserve=ownership config/* "${pkgdir}/var/lib/${pkgname}/config"

    install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m755 "${srcdir}/${pkgname}-config.sh" "${pkgdir}/usr/bin/${pkgname}-config"
    install -D -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m644 "${srcdir}/${pkgname}-user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -D -m644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    # disable auto-updates and version checks
    sed -i 's/"AutoUpdates": true,/"AutoUpdates": false,/g' ${pkgdir}/var/lib/${pkgname}/config/ASF.json
    sed -i 's/"UpdateChannel": 1,/"UpdateChannel": 0,/g' ${pkgdir}/var/lib/${pkgname}/config/ASF.json
}
