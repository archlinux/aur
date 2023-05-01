# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Lucki

pkgbase=asf
pkgname=('asf-plugin-steamtokendumper'
         'asf-plugin-itemsmatcher'
         'asf-plugin-mobileauthenticator'
         'asf-plugin-periodicgc'
         'asf-plugin-signinwithsteam'
         'asf')
pkgver="5.4.5.2"
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
makedepends=('git' 'dotnet-sdk>=7.0' 'aspnet-runtime>=7.0')
dotnet_framework='net7.0'
changelog=changelog
install=install
source=("asf::git+https://github.com/JustArchiNET/ArchiSteamFarm.git#tag=${pkgver}?signed"
        "service.patch"
        "asf.env"
        "ASF.json"
        "NLog.config")
validpgpkeys=('1268A81616AFDC20C55779ED6B138B4C64555AEA')
sha256sums=('SKIP'
            'cc6828798785b6b5e53b0b231ba7167c727295dfc95a307cdeb16b7c703d197e'
            'ec82f54a9b362e2305a775eb1473522636ab724f18d846828410c39344801db4'
            'c300c5ce63c0237d7558b5b303159b8e2a8e5323f581cc8435dd2a6f1ead5332'
            '636f3a125071cabfcb0c3828c6f9b0ec613789ab846ff71448d1a6eb110aee3f')

prepare() {
    cd ${srcdir}/asf/ArchiSteamFarm/overlay/variant-base/linux
    patch --forward --input="${srcdir}/service.patch"
}

build() {
    cd asf
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    [[ "$CARCH" == "x86_64" ]] && architecture="x64"
    [[ "$CARCH" == "armv7h" ]] && architecture="arm"
    [[ "$CARCH" == "aarch64" ]] && architecture="arm64"
    export DOTNET_FLAGS="--configuration Release --framework "${dotnet_framework}" -p:UseAppHost=false --nologo"
    export PUBLISH_FLAGS="--runtime linux-"${architecture}" --no-self-contained"
    dotnet publish "ArchiSteamFarm" -o "out/result" $DOTNET_FLAGS $PUBLISH_FLAGS
    dotnet publish "ArchiSteamFarm.OfficialPlugins.ItemsMatcher" -o "out/result/plugins/ArchiSteamFarm.OfficialPlugins.ItemsMatcher" $DOTNET_FLAGS $PUBLISH_FLAGS
    dotnet publish "ArchiSteamFarm.OfficialPlugins.SteamTokenDumper" -o "out/result/plugins/ArchiSteamFarm.OfficialPlugins.SteamTokenDumper" $DOTNET_FLAGS $PUBLISH_FLAGS
    dotnet publish "ArchiSteamFarm.OfficialPlugins.MobileAuthenticator" -o "out/result/plugins/ArchiSteamFarm.OfficialPlugins.MobileAuthenticator" $DOTNET_FLAGS $PUBLISH_FLAGS
    dotnet publish "ArchiSteamFarm.CustomPlugins.PeriodicGC" -o "out/result/plugins/ArchiSteamFarm.CustomPlugins.PeriodicGC" $DOTNET_FLAGS $PUBLISH_FLAGS
    dotnet publish "ArchiSteamFarm.CustomPlugins.SignInWithSteam" -o "out/result/plugins/ArchiSteamFarm.CustomPlugins.SignInWithSteam" $DOTNET_FLAGS $PUBLISH_FLAGS
}

check() {
    cd asf
    dotnet test ArchiSteamFarm.Tests $DOTNET_FLAGS
}

package_asf-plugin-steamtokendumper() {
    pkgdesc="SteamTokenDumper plugin for ArchiSteamFarm."
    depends=('asf')

    install -d -m 755 ${pkgdir}/usr/lib/asf/plugins/ArchiSteamFarm.OfficialPlugins.SteamTokenDumper
    mv asf/out/result/plugins/ArchiSteamFarm.OfficialPlugins.SteamTokenDumper "${pkgdir}/usr/lib/asf/plugins/"
}

package_asf-plugin-itemsmatcher() {
    pkgdesc="ItemsMatcher plugin for ArchiSteamFarm."
    depends=('asf')

    install -d -m 755 ${pkgdir}/usr/lib/asf/plugins/ArchiSteamFarm.OfficialPlugins.ItemsMatcher
    mv asf/out/result/plugins/ArchiSteamFarm.OfficialPlugins.ItemsMatcher "${pkgdir}/usr/lib/asf/plugins/"
}

package_asf-plugin-mobileauthenticator() {
    pkgdesc="MobileAuthenticator plugin for ArchiSteamFarm."
    depends=('asf')

    install -d -m 755 ${pkgdir}/usr/lib/asf/plugins/ArchiSteamFarm.OfficialPlugins.MobileAuthenticator
    mv asf/out/result/plugins/ArchiSteamFarm.OfficialPlugins.MobileAuthenticator "${pkgdir}/usr/lib/asf/plugins/"
}

package_asf-plugin-periodicgc() {
    pkgdesc="PeriodicGC plugin for ArchiSteamFarm."
    depends=('asf')

    install -d -m 755 ${pkgdir}/usr/lib/asf/plugins/ArchiSteamFarm.CustomPlugins.PeriodicGC
    mv asf/out/result/plugins/ArchiSteamFarm.CustomPlugins.PeriodicGC "${pkgdir}/usr/lib/asf/plugins/"
}

package_asf-plugin-signinwithsteam() {
    pkgdesc="SignInWithSteam plugin for ArchiSteamFarm."
    depends=('asf')

    install -d -m 755 ${pkgdir}/usr/lib/asf/plugins/ArchiSteamFarm.CustomPlugins.SignInWithSteam
    mv asf/out/result/plugins/ArchiSteamFarm.CustomPlugins.SignInWithSteam "${pkgdir}/usr/lib/asf/plugins/"
}

package_asf() {
    pkgdesc="Steam cards farmer."
    depends=('aspnet-runtime>=7.0')
    optdepends=('asf-ui: standalone web interface for ASF'
                'asf-plugin-itemsmatcher'
                'asf-plugin-mobileauthenticator'
                'asf-plugin-steamtokendumper')
    backup=('var/lib/asf/config/ASF.json' 'usr/lib/asf/NLog.config')

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
    install -D -m644 "${srcdir}/asf/ArchiSteamFarm/overlay/variant-base/linux/ArchiSteamFarm@.service" "${pkgdir}/usr/lib/systemd/system/ArchiSteamFarm@.service"

    # Setup system user and group
    echo 'u asf - "ArchiSteamFarm" /var/lib/asf' |
      install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
    echo -e 'd /var/lib/asf 0755 asf asf -\nd /tmp/ASF 0777 asf asf -' |
      install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}
