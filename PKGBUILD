# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname="asf"
pkgver="4.0.4.2"
pkgrel=1
pkgdesc="Steam cards farmer."
arch=('x86_64' 'arm' 'i686')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
depends_x86_64=('dotnet-host' 'libunwind' 'openssl-1.0')
depends_arm=('dotnet-host' 'libunwind' 'openssl-1.0')
depends_i686=('dotnet-runtime')
makedepends=('p7zip')
changelog=changelog
backup=('var/lib/asf/config/ASF.json' 'usr/lib/asf/NLog.config')
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
sha256sums_x86_64=('52b6ee2206ffca8247b90c1e346e5359469ab4c144243593a06f0a16aa3daa50')
sha256sums_arm=('f30ce6c72f0c8b82adb857c98cb4b1bbb164d46cbcbd4ad599798889fbc42023')
sha256sums_i686=('07f09b580b849c4455775160d5a96749925afb4a98303f5b8070cf1a67d19f7f')
noextract=("${source_x86_64[@]%%::*}" "${source_arm[@]%%::*}" "${source_i686[@]%%::*}")

prepare() {
    7z x -o"${srcdir}/asf" ${pkgname}-${pkgver}-${CARCH}.zip
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
