# Maintainer: Brian Elder <gth747m@gmail.com>

pkgname=forge-server-unstable
pkgdesc="Forge is a free, open-source modding API all of your favourite mods use!"
url="https://minecraftforge.net"

pkgver=60.0.14
pkgrel=1
_minecraftver=1.21.10
_licensever=1.21.x
_srvpath="/opt"

arch=("any")
license=("custom")
depends=("jdk-openjdk")
optdepends=("tar: needed in order to create world backups")
provides=("forge-server-unstable=60.0.14")
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
            "b6ab7924976a32d0b9a62024233667277da1dc60fe92678c40b8f1cf04b829bfba45b4dd188aeabf8ca94f60bcf6bc03664ae68bda4ef0a4dd24914142037460"
            "bfda8a268b2fcb9877fe716d2d3f68b6bc11ba056d8890178c40e51995fa067b2b4f2e1865c0dcc7489dd037f22fe95ae8b5d50b9cb7000ce4854c48072c042d"
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
