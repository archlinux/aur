# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname="asf"
pkgver="3.1.1.9"
pkgrel=1
pkgdesc="Steam cards farmer."
arch=('any')
url="https://github.com/JustArchi/ArchiSteamFarm"
license=('Apache')
depends=('dotnet-runtime')
makedepends=('p7zip')
changelog=changelog
backup=('var/lib/asf/config/ASF.json')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.zip::https://github.com/JustArchi/ArchiSteamFarm/releases/download/${pkgver}/ASF-generic.zip"
        "${pkgname}.sh"
        "${pkgname}.service"
        "${pkgname}-user.service"
        "${pkgname}.sysusers"
        "NLog.config")
sha256sums=('5842059e3637aeefaaafe45c9bdee1b181c13290d9fb453bbc9f0e8c2d0f2ef0'
            '8d76996c1024b80704b25af8a8800ef3f8a8a518d19c2a1e85ba62b58b22cdfd'
            'e63b55f65e1c0c935945bd788f47a77be82e96a409b64660b5a96b9c190964ff'
            'dcaf43586125e07488e338438158097b31ba335fcb238127dfb785a41d223f49'
            '883373be23f6f49ae597f61c1310d8cd45bce7c3ee1b5d456ffc9fedbe7dd486'
            'bfefd169626c3aff072e361a0517f2fbc0d2d403c8c61e1659c0bd0174d3d14a')
noextract=("${source[@]%%::*}")

prepare() {
    7z x -o"${srcdir}/asf" ${pkgname}-${pkgver}.zip
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

    # disable auto-updates and version checks
    sed -i 's/"UpdateChannel": 1/"UpdateChannel": 0/g' "${pkgdir}/var/lib/${pkgname}/config/ASF.json"
    sed -i 's/"UpdatePeriod": 24/"UpdatePeriod": 0/g' "${pkgdir}/var/lib/${pkgname}/config/ASF.json"
}
