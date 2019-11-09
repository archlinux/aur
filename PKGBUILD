# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname="asf"
pkgver="4.1.0.3"
pkgrel=2
pkgdesc="Steam cards farmer."
arch=('x86_64' 'arm' 'i686')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
depends_x86_64=('dotnet-host>=3.0' 'libunwind' 'openssl-1.0')
depends_arm=('dotnet-host>=3.0' 'libunwind' 'openssl-1.0')
depends_i686=('dotnet-runtime>=3.0')
makedepends=('unzip')
changelog=changelog
backup=('var/lib/asf/config/ASF.json' 'usr/lib/asf/NLog.config')
options=('staticlibs')
install=install
source=("${pkgname}.sh"
        "service"
        "service.user"
        "ASF.json"
        "NLog.config")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/${pkgver}/ASF-linux-x64.zip")
source_arm=("${pkgname}-${pkgver}-arm.zip::https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/${pkgver}/ASF-linux-arm.zip")
source_i686=("${pkgname}-${pkgver}-i686.zip::https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/${pkgver}/ASF-generic.zip")
sha256sums=('8d76996c1024b80704b25af8a8800ef3f8a8a518d19c2a1e85ba62b58b22cdfd'
            '4b32dd8aa10dd862d63862a8e14fca04afa9e7b2c155344bc8adfcddb0a76d52'
            'c6e89b39537f64e10195c6be5ee98fe66ed564d3126cc2140eaa49d53b68be8c'
            'e63a92fd8008c40dab963161bdac967b57146553c00f114469c204ac6e1795b2'
            '2807b65c35959b0a0a255850facecc0286b7afdb5aa9b7b9315bf0165e87b0e0')
sha256sums_x86_64=('e61550b5e961a602a68e399dd08fe84855087810602937cd50be148c1c1bdc45')
sha256sums_arm=('6b34766976b1fabc10b6ffa2eddb2f41c9030bf9d0f9f9d6e242a0f6c3d591ea')
sha256sums_i686=('c9dedc65c03bf18dbbe8f24a49f0796d05ad610dcec47d73ae337324f500b62d')
noextract=("${source_x86_64[@]%%::*}" "${source_arm[@]%%::*}" "${source_i686[@]%%::*}")

prepare() {
    unzip -d "${srcdir}/asf" ${pkgname}-${pkgver}-${CARCH}.zip
}

package() {
    install -d -m 755 "${pkgdir}/usr/lib/${pkgname}"
    cp -rdp --no-preserve=ownership "${srcdir}/asf" "${pkgdir}/usr/lib"
    find "${pkgdir}/usr/lib/${pkgname}" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 {} \;

    install -d -m 755 "${pkgdir}/var/lib/${pkgname}/config"
    mv "${pkgdir}/usr/lib/${pkgname}/config" "${pkgdir}/var/lib/${pkgname}"
    ln -sf "/var/lib/${pkgname}/config" "${pkgdir}/usr/lib/${pkgname}/config"

    install -D -m644 "${srcdir}/ASF.json" "${pkgdir}/var/lib/${pkgname}/config/ASF.json"
    install -D -m644 "${srcdir}/NLog.config" "${pkgdir}/usr/lib/${pkgname}/NLog.config"

    install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -D -m644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m644 "${srcdir}/service.user" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    # Setup system user and group
    echo 'u asf - "ArchiSteamFarm" /var/lib/asf' |
      install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
    echo 'd /var/lib/asf 0755 asf asf -' |
      install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}
