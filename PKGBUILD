# Maintainer: Brian Elder <gth747m@gmail.com>

pkgname=forge-server-unstable
pkgdesc="Forge is a free, open-source modding API all of your favourite mods use!"
url="https://minecraftforge.net"

pkgver=65.1.1
pkgrel=1
_minecraftver=26.2
_licensever=26.2
_srvpath="/opt"

arch=("any")
license=("custom")
depends=("jdk-openjdk")
optdepends=("tar: needed in order to create world backups")
provides=("forge-server-unstable=65.1.1")
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
sha512sums=("1f30ec90fae7f3b450affdd73cf3dce738287eecc274fd6d066a575bf75b19d6988b482144a33c80603326485d6b69b0cac866dc5ab25feccfce912d920712fa"
            "39d728f774aa3f70191b0299b88b1eb923ae605aafb621727dd0d56e2b75b0089fc6da59fa647f90822e8aded7985bd3506ab8a61b8783120b629fd3af3837e1"
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
