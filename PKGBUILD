# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Philip Abernethy <chais.z3r0@gmail.com>

_pkgname=tshock
pkgname=${_pkgname}
pkgver=4.3.26
# Because of tag 4.2200 is 4.2.2.1228 and tag 4.2202 is 4.2.2.0224 epoch must be 1
epoch=1
pkgrel=1
pkgdesc="A Terraria Server administration modification that runs on the open source TerrariaAPI."
arch=(any)
url="http://tshock.co/xf"
license=("GPL3")
depends=("mono" "tmux")
makedepends=("nuget")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/Pryaxis/TShock.git#tag=v${pkgver}"
        "tshock.sh"
        "default.conf"
        "service"
        "tmpfiles"
        "sysusers")
sha512sums=('SKIP'
            'f0958448b53ff9851c47876b89f1cef6d3e33ce1b8cbe13167c685ed1c9d89a8bf0f01929d47200e4f0f964c3e7796a2d9ca558e5d9f1269db3f2e4537a6c97a'
            'd530a528ba84d57dfcb360e03ec62b1b38da6fa2383bef8cdb0cd039ba6466b053dd99a130a858c86405c8957ba86a0a080f2f56089843a7055662fa41cee102'
            '7c1788f21664f038c32da6c0cbe817404a83f81b7b8be07bb0483d5ffd35991a07b647b18d7aa316db369edd4e7eab21c1b81ab3b45aa2c3692c6c63673a3fdb'
            'a04b458932bb3882b9d40f9b5a9074b681e60cb3284635d1efb7e54293f39df334e7ae526dabf50f633ecdde980f287a939d3ea6eb0d4098663fbda21af70a65'
            '5752f8453fbb4d973ebe71bba371ae7b0ddd2313ccd17de89b3942d024e295805324085640756e7118e4cc76abee675f5e253526261cb62cb76b0bc155aca317')

backup=("etc/conf.d/${_pkgname}/default.conf")


prepare() {
    cd "$_pkgname"

    git submodule init
    git submodule update

    export BUILD_MODE=Release

    nuget restore
    nuget restore TerrariaServerAPI/

    xbuild TerrariaServerAPI/TShock.4.OTAPI.sln /p:Configuration=$BUILD_MODE

    pushd "TerrariaServerAPI/TShock.Modifications.Bootstrapper/bin/${BUILD_MODE}"
    mono TShock.Modifications.Bootstrapper.exe -in=OTAPI.dll -mod=../../../TShock.Modifications.**/bin/$BUILD_MODE/TShock.Modifications.*.dll -o=Output/OTAPI.dll
    popd

    xbuild ./TerrariaServerAPI/TerrariaServerAPI/TerrariaServerAPI.csproj /p:Configuration=$BUILD_MODE

    # Workaround
    mkdir -p "TShockAPI/bin/Release"
    cp "TerrariaServerAPI/TShock.Modifications.Bootstrapper/bin/Release/Output/OTAPI.dll" "TShockAPI/bin/Release/OTAPI.dll"

}

build() {
    cd "$_pkgname"

    export BUILD_MODE=Release

    xbuild ./TShockAPI/TShockAPI.csproj /p:Configuration=$BUILD_MODE
}

package() {
    install -Dm755 "${srcdir}/tshock.sh" "${pkgdir}/usr/bin/tshock"

    install -Dm644 "${srcdir}/default.conf" "${pkgdir}/etc/conf.d/${_pkgname}/default.conf"

    # Install sysusers
    install -Dm644 "${srcdir}/sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"

    # Install tmpfiles
    install -Dm644 "${srcdir}/tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"

    # Install service
    install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/tshock@.service"

    cd "$_pkgname"

    basedir="${pkgdir}/srv/tshock"

    install -Dm755 "TerrariaServerAPI/TerrariaServerAPI/bin/Release/TerrariaServer.exe" "${basedir}/TerrariaServer.exe"
    install -Dm644 "TerrariaServerAPI/TerrariaServerAPI/bin/Release/OTAPI.dll" "${basedir}/OTAPI.dll"
    install -Dm644 "prebuilts/sqlite3.dll" "${basedir}/sqlite3.dll"
    install -Dm644 "prebuilts/GeoIP.dat" "${basedir}/GeoIP.dat"
    install -Dm644 "packages/Newtonsoft.Json.10.0.3/lib/net45/Newtonsoft.Json.dll" "${basedir}/Newtonsoft.Json.dll"

    install -Dm644 "prebuilts/HttpServer.dll" "${basedir}/ServerPlugins/HttpServer.dll"
    install -Dm644 "prebuilts/Mono.Data.Sqlite.dll" "${basedir}/ServerPlugins/Mono.Data.Sqlite.dll"
    install -Dm644 "packages/BCrypt.Net.0.1.0/lib/net35/BCrypt.Net.dll" "${basedir}/ServerPlugins/BCrypt.Net.dll"
    install -Dm644 "packages/MySql.Data.6.9.8/lib/net45/MySql.Data.dll" "${basedir}/ServerPlugins/MySql.Data.dll"

    install -Dm644 "TShockAPI/bin/Release/TShockAPI.dll" "${basedir}/ServerPlugins/TShockAPI.dll"

}
