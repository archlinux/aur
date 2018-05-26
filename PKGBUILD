# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname="asf"
pkgver="3.1.2.9"
pkgrel=1
pkgdesc="Steam cards farmer."
arch=('x86_64' 'arm' 'i686')
url="https://github.com/JustArchi/ArchiSteamFarm"
license=('Apache')
depends_x86_64=('dotnet-host' 'libunwind' 'openssl-1.0')
depends_arm=('dotnet-host' 'libunwind' 'openssl-1.0')
depends_i686=('dotnet-runtime')
makedepends=('p7zip')
changelog=changelog
backup=('var/lib/asf/config/ASF.json' 'usr/lib/asf/NLog.config')
install=${pkgname}.install
source=("${pkgname}.sh"
        "${pkgname}.service"
        "${pkgname}-user.service"
        "${pkgname}.sysusers"
        "NLog.config")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/JustArchi/ArchiSteamFarm/releases/download/${pkgver}/ASF-linux-x64.zip")
source_arm=("${pkgname}-${pkgver}-arm.zip::https://github.com/JustArchi/ArchiSteamFarm/releases/download/${pkgver}/ASF-linux-arm.zip")
source_i686=("${pkgname}-${pkgver}-i686.zip::https://github.com/JustArchi/ArchiSteamFarm/releases/download/${pkgver}/ASF-generic.zip")
sha256sums=('8d76996c1024b80704b25af8a8800ef3f8a8a518d19c2a1e85ba62b58b22cdfd'
            'e605b05ece2e86d02277b3a703f92b74817fd494dbd6195173dc20bbf33fb14a'
            'dcaf43586125e07488e338438158097b31ba335fcb238127dfb785a41d223f49'
            '883373be23f6f49ae597f61c1310d8cd45bce7c3ee1b5d456ffc9fedbe7dd486'
            '9a10e9e6ff88fcc00000c12464ae2b650a3f075ef7e440088414b46c41214ee4')
sha256sums_x86_64=('e821cc6c7e713d4633c7b03bb75a7904fb34ebb94947d5e066d4a0fb300b8fcf')
sha256sums_arm=('92f8c21b01759f7417ce542d336d63746c35c77847e4d7e981892d447c05ce4b')
sha256sums_i686=('44038a2fe4523795663f84144b388d697521b60d0b428c9cddb0e1a291aedc83')
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

    install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m644 "${srcdir}/${pkgname}-user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -D -m644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m644 "${srcdir}/NLog.config" "${pkgdir}/usr/lib/${pkgname}/NLog.config"

    # enable headless daemon
    sed -i 's/"IPC": false/"IPC": true/g' "${pkgdir}/var/lib/${pkgname}/config/ASF.json"

    # disable auto-updates and version checks
    sed -i 's/"UpdateChannel": 1/"UpdateChannel": 0/g' "${pkgdir}/var/lib/${pkgname}/config/ASF.json"
    sed -i 's/"UpdatePeriod": 24/"UpdatePeriod": 0/g' "${pkgdir}/var/lib/${pkgname}/config/ASF.json"
}
