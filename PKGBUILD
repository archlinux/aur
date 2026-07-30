# Maintainer: Brian Elder <gth747m@gmail.com>

pkgname=forge-server
pkgdesc="Forge is a free, open-source modding API all of your favourite mods use!"
url="https://minecraftforge.net"

pkgver=65.1.0
pkgrel=1
_minecraftver=26.2
_licensever=26.2
_srvpath="/opt"

arch=("any")
license=("custom")
depends=("jdk-openjdk")
optdepends=("tar: needed in order to create world backups")
provides=("forge-server=65.1.0")
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
sha512sums=("1f30ec90fae7f3b450affdd73cf3dce738287eecc274fd6d066a575bf75b19d6988b482144a33c80603326485d6b69b0cac866dc5ab25feccfce912d920712fa"
            "dacc83b27fa1e2f6399abbdce89327c9071b6ae6e8ecac940185e79102b7f42225db332012ff615cbc4677b5bbc93db331cda9542a86229c6a0ff882a989ccc1"
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
