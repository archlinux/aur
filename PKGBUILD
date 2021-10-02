# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Lucki

pkgname="asf"
pkgver="5.1.4.0"
pkgrel=1
pkgdesc="Steam cards farmer."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
depends=('aspnet-runtime>=5.0.5')
optdepends=('asf-ui: standalone web interface for ASF')
makedepends=('git' 'dotnet-sdk>=5.0.5')
changelog=changelog
backup=('var/lib/asf/config/ASF.json' 'usr/lib/asf/NLog.config')
install=install
source=("asf::git+https://github.com/JustArchiNET/ArchiSteamFarm.git#tag=${pkgver}"
        "service.patch"
        "asf.env"
        "ASF.json"
        "NLog.config")
sha256sums=('SKIP'
            '18b8b32774df8b9cfc4e75f003a29119b2fbccf6c582afa7c404485222c5b818'
            'ec82f54a9b362e2305a775eb1473522636ab724f18d846828410c39344801db4'
            'c300c5ce63c0237d7558b5b303159b8e2a8e5323f581cc8435dd2a6f1ead5332'
            'c6d8dff9306532babf5100629ea48a5322561823a4c7416f02dacbbee5ab30da')

prepare() {
    cd ${srcdir}/asf/ArchiSteamFarm/overlay/linux
    patch --forward --input="${srcdir}/service.patch"
}

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

    install -D -m644 "${srcdir}/asf.env" "${pkgdir}/etc/asf/asf"
    install -D -m644 "${srcdir}/asf/ArchiSteamFarm/overlay/linux/ArchiSteamFarm@.service" "${pkgdir}/usr/lib/systemd/system/ArchiSteamFarm@.service"

    # Setup system user and group
    echo 'u asf - "ArchiSteamFarm" /var/lib/asf' |
      install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
    echo 'd /var/lib/asf 0755 asf asf -' |
      install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}
