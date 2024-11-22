# Maintainer: Brian Elder <gth747m@gmail.com>

pkgname=forge-server-unstable
pkgdesc="Forge is a free, open-source modding API all of your favourite mods use!"
url="https://minecraftforge.net"

pkgver=53.0.19
pkgrel=1
_minecraftver=1.21.3
_licensever=1.21.x
_srvpath="/opt"

arch=("any")
license=("custom")
depends=("jdk-openjdk")
optdepends=("tar: needed in order to create world backups")
provides=("forge-server-unstable=${forge_major}.${forge_minor}.${forge_patch}")
backup=("opt/forge-server-unstable/banned-ips.json"
        "opt/forge-server-unstable/banned-players.json"
        "opt/forge-server-unstable/config"
        "opt/forge-server-unstable/eula.txt"
        "opt/forge-server-unstable/logs"
        "opt/forge-server-unstable/mods"
        "opt/forge-server-unstable/ops.json"
        "opt/forge-server-unstable/server.properties"
        "opt/forge-server-unstable/usercache.json"
        "opt/forge-server-unstable/user_jvm_args.txt"
        "opt/forge-server-unstable/whitelist.json"
        "opt/forge-server-unstable/world")
install="forge-server-unstable.install"
source=("https://raw.githubusercontent.com/MinecraftForge/MinecraftForge/${_licensever}/LICENSE.txt"
        "https://maven.minecraftforge.net/net/minecraftforge/forge/${_minecraftver}-${pkgver}/forge-${_minecraftver}-${pkgver}-installer.jar"
        "forge-server-unstable.service"
        "eula.txt")
noextract=("forge-${_minecraftver}-${pkgver}-installer.jar")
sha512sums=("ecee0462a1cad389def4cd1ce1f24f7b5cf0bb1552f45db0482ac0fa7badc54a251adb735977a1dce3412a09716ce44b0ddf81c37dcfad3a5ac5d8e3516be3c8"
            "531705795bac5e96a17bb84d9245786e2760dc8fe524a1bb646c9723fa52698dcdef207a6a378d0ce524b1d6d22730b2c421e5b97965b0bc1c3b1eb7f19e3273"
            "61b138d41977b1d338ec24e97597a3fdd21758e3384f72a126c51b368bf95be6968fc3a5b439dc998b7f885dedb4e3262eb74061807e400ec7d540c72afcc65d"
            "68205ffc60327c67a5ebe778598c3350d64b48aad9dacf52fcde435a535a074ba2056db30dff1b18e3c8e38510acd6ececa298b13cd4c4203636560fa4cf70cb")

prepare() {
    mkdir -p forge-server-unstable || exit
}

build() {
    java -jar "./forge-${_minecraftver}-${pkgver}-installer.jar" --installServer ./forge-server-unstable
}

package() {
    install -d "${pkgdir}/${_srvpath}/${pkgname}"
    install -Dm444 "LICENSE.txt" "${pkgdir}/${_srvpath}/${pkgname}"
    install -Dm644 "eula.txt" "${pkgdir}/${_srvpath}/${pkgname}"
    cp -r "./${pkgname}" "${pkgdir}/${_srvpath}"
    ln -s "forge-${_minecraftver}-${pkgver}-shim.jar" "${pkgdir}/${_srvpath}/${pkgname}/forge-server-unstable.jar"
    install -Dm644 "${srcdir}/forge-server-unstable.service" "${pkgdir}/usr/lib/systemd/system/forge-server-unstable.service"
}
