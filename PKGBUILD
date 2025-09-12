# Maintainer: Brian Elder <gth747m@gmail.com>

pkgname=forge-server
pkgdesc="Forge is a free, open-source modding API all of your favourite mods use!"
url="https://minecraftforge.net"

pkgver=58.1.0
pkgrel=1
_minecraftver=1.21.8
_licensever=1.21.x
_srvpath="/opt"

arch=("any")
license=("custom")
depends=("jdk-openjdk")
optdepends=("tar: needed in order to create world backups")
provides=("forge-server=58.1.0")
backup=("opt/forge-server/banned-ips.json"
        "opt/forge-server/banned-players.json"
        "opt/forge-server/config"
        "opt/forge-server/eula.txt"
        "opt/forge-server/logs"
        "opt/forge-server/mods"
        "opt/forge-server/ops.json"
        "opt/forge-server/server.properties"
        "opt/forge-server/usercache.json"
        "opt/forge-server/user_jvm_args.txt"
        "opt/forge-server/whitelist.json"
        "opt/forge-server/world")
install="forge-server.install"
source=("https://raw.githubusercontent.com/MinecraftForge/MinecraftForge/${_licensever}/LICENSE.txt"
        "https://maven.minecraftforge.net/net/minecraftforge/forge/${_minecraftver}-${pkgver}/forge-${_minecraftver}-${pkgver}-installer.jar"
        "forge-server.service"
        "eula.txt")
noextract=("forge-${_minecraftver}-${pkgver}-installer.jar")
sha512sums=("ecee0462a1cad389def4cd1ce1f24f7b5cf0bb1552f45db0482ac0fa7badc54a251adb735977a1dce3412a09716ce44b0ddf81c37dcfad3a5ac5d8e3516be3c8"
            "49f219772e6c6a05fdf968b879791ca093b0b47ec9da4575a2d079874a6a9edcf804184e1f5ef481c68e31d5911baef767946dd34afe66b15ecd34f3dd7a4b7c"
            "6e4e7f4d9486ece03e812d3373220d93d1934f1f3bcc86f4075cde6fb0ee76fb6ff7a2d3c19f884602ee89a6b46934bd1f90334c577e560de0d065a5c7449a05"
            "68205ffc60327c67a5ebe778598c3350d64b48aad9dacf52fcde435a535a074ba2056db30dff1b18e3c8e38510acd6ececa298b13cd4c4203636560fa4cf70cb")

prepare() {
    mkdir -p forge-server || exit
}

build() {
    java -jar "./forge-${_minecraftver}-${pkgver}-installer.jar" --installServer ./forge-server
}

package() {
    install -d "${pkgdir}/${_srvpath}/${pkgname}"
    install -Dm444 "LICENSE.txt" "${pkgdir}/${_srvpath}/${pkgname}"
    install -Dm644 "eula.txt" "${pkgdir}/${_srvpath}/${pkgname}"
    cp -r "./${pkgname}" "${pkgdir}/${_srvpath}"
    ln -s "forge-${_minecraftver}-${pkgver}-shim.jar" "${pkgdir}/${_srvpath}/${pkgname}/forge-server.jar"
    install -Dm644 "${srcdir}/forge-server.service" "${pkgdir}/usr/lib/systemd/system/forge-server.service"
}
