# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Lucki

pkgname="asf"
pkgver="4.1.1.4"
pkgrel=2
_asfuicommit="575e11498d432ec37a08236b8801110addac676d"
pkgdesc="Steam cards farmer."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
depends=('aspnet-runtime>=3.1')
makedepends=('dotnet-sdk>=3.1' 'npm')
changelog=changelog
backup=('var/lib/asf/config/ASF.json' 'usr/lib/asf/NLog.config')
install=install
source=("https://github.com/JustArchi/ArchiSteamFarm/archive/${pkgver}.tar.gz"
        "${pkgname}-ASF-ui-${_asfuicommit}.tar.gz::https://github.com/JustArchiNET/ASF-ui/archive/${_asfuicommit}.tar.gz"
        "${pkgname}.sh"
        "service"
        "service.user"
        "ASF.json"
        "NLog.config")
sha256sums=('7da3b7954300ef6a69e1ab97f96ccc66c03ccd36165c90a54cb3e539c5741d1b'
            '16283371243377d768bc3ee8d175e7bc0f291178d419cf245478516cc72e2b78'
            '8d76996c1024b80704b25af8a8800ef3f8a8a518d19c2a1e85ba62b58b22cdfd'
            'ba1ff85e55e56d71dbdd0d898244ff7725bced8625f29c5389e28525e6cdb987'
            'b627c8d4b3ba7f194a44749bd401b33bae601b9570da98e457737a6f9cfa408f'
            'e63a92fd8008c40dab963161bdac967b57146553c00f114469c204ac6e1795b2'
            '1353977a61a2e8700df80729cabc88f453b704a0c6ccf45d80a91691fcf6338f')

prepare() {
    cp -rdp --no-preserve=ownership "ASF-ui-${_asfuicommit}/." "ArchiSteamFarm-${pkgver}/ASF-ui"
}

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
