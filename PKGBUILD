# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Lucki

pkgname="asf"
pkgver="5.0.1.2"
pkgrel=1
pkgdesc="Steam cards farmer."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
depends=('aspnet-runtime>=5.0')
optdepends=('asf-ui: standalone web interface for ASF')
makedepends=('git' 'dotnet-sdk>=5.0')
changelog=changelog
backup=('var/lib/asf/config/ASF.json' 'usr/lib/asf/NLog.config')
install=install
source=("asf::git+https://github.com/JustArchiNET/ArchiSteamFarm.git#tag=${pkgver}"
        "service"
        "service.user"
        "ASF.json"
        "NLog.config")
sha256sums=('SKIP'
            'ba1ff85e55e56d71dbdd0d898244ff7725bced8625f29c5389e28525e6cdb987'
            'b627c8d4b3ba7f194a44749bd401b33bae601b9570da98e457737a6f9cfa408f'
            'e63a92fd8008c40dab963161bdac967b57146553c00f114469c204ac6e1795b2'
            'c6d8dff9306532babf5100629ea48a5322561823a4c7416f02dacbbee5ab30da')

build() {
    cd asf
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    ./cc.sh --no-pull --no-asf-ui
}

package() {
    cd asf/out/result
    install -d -m 755 "${pkgdir}/usr/lib/${pkgname}"
    cp -rdp --no-preserve=ownership . "${pkgdir}/usr/lib/asf"
    install -D -m755 ../../run.sh "${pkgdir}/usr/bin/${pkgname}"
    sed -i 's,^\(BINARY_DIR[ ]*=\).*,\1'/usr/lib/asf',g' "${pkgdir}/usr/bin/${pkgname}"
    find "${pkgdir}/usr/lib/${pkgname}" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 {} \;

    install -d -m 755 "${pkgdir}/var/lib/${pkgname}/config"
    install -D -m644 "${srcdir}/ASF.json" "${pkgdir}/var/lib/${pkgname}/config/ASF.json"
    install -D -m644 "${srcdir}/NLog.config" "${pkgdir}/usr/lib/${pkgname}/NLog.config"

    install -D -m644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m644 "${srcdir}/service.user" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    # Setup system user and group
    echo 'u asf - "ArchiSteamFarm" /var/lib/asf' |
      install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
    echo 'd /var/lib/asf 0755 asf asf -' |
      install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}
