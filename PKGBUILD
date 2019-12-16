# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname="asf"
pkgver="4.1.1.3"
pkgrel=1
pkgdesc="Steam cards farmer."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
depends=('aspnet-runtime>=3.1')
makedepends=('dotnet-sdk>=3.1')
changelog=changelog
backup=('var/lib/asf/config/ASF.json' 'usr/lib/asf/NLog.config')
install=install
source=("https://github.com/JustArchi/ArchiSteamFarm/archive/${pkgver}.tar.gz"
        "${pkgname}.sh"
        "service"
        "service.user"
        "ASF.json"
        "NLog.config")
sha256sums=('efabe61de903512f2666aaf6529aa356f7a6605b871cddf00c4c92f865634240'
            '8d76996c1024b80704b25af8a8800ef3f8a8a518d19c2a1e85ba62b58b22cdfd'
            'ba1ff85e55e56d71dbdd0d898244ff7725bced8625f29c5389e28525e6cdb987'
            'b627c8d4b3ba7f194a44749bd401b33bae601b9570da98e457737a6f9cfa408f'
            'e63a92fd8008c40dab963161bdac967b57146553c00f114469c204ac6e1795b2'
            '2807b65c35959b0a0a255850facecc0286b7afdb5aa9b7b9315bf0165e87b0e0')

build() {
    cd ArchiSteamFarm-${pkgver}
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    ./cc.sh
}

package() {
    cd ArchiSteamFarm-${pkgver}/out
    install -d -m 755 "${pkgdir}/usr/lib/${pkgname}"
    cp -rdp --no-preserve=ownership . "${pkgdir}/usr/lib/asf"
    find "${pkgdir}/usr/lib/${pkgname}" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 {} \;

    install -d -m 755 "${pkgdir}/var/lib/${pkgname}/config"
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
