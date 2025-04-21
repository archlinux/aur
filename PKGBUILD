# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Brian Elder <gth747m@gmail.com>

pkgname=neoforge-server
pkgdesc="Neo Modding API for Minecraft, based on Forge"
url="https://neoforged.net"

# See https://projects.neoforged.net/neoforged/neoforge to select a version

pkgver=21.1.160 # Minecraft version 1.21.1
pkgrel=1
_licensever=1.21.x
_srvpath="/opt"

arch=("any")
license=("LGPL-2.1-or-later")
depends=("jdk-openjdk")
optdepends=("tar: needed in order to create world backups")
provides=("neoforge-server=${forge_major}.${forge_minor}.${forge_patch}")
backup=("opt/neoforge-server/banned-ips.json"
        "opt/neoforge-server/banned-players.json"
        "opt/neoforge-server/config"
        "opt/neoforge-server/eula.txt"
        "opt/neoforge-server/logs"
        "opt/neoforge-server/mods"
        "opt/neoforge-server/ops.json"
        "opt/neoforge-server/server.properties"
        "opt/neoforge-server/usercache.json"
        "opt/neoforge-server/user_jvm_args.txt"
        "opt/neoforge-server/whitelist.json"
        "opt/neoforge-server/world")
install="neoforge-server.install"
source=("https://github.com/neoforged/NeoForge/blob/${_licensever}/LICENSE.txt"
        "https://maven.neoforged.net/releases/net/neoforged/neoforge/${pkgver}/neoforge-${pkgver}-installer.jar"
        "neoforge-server.service"
        "eula.txt")
noextract=("neoforge-${pkgver}-installer.jar")
sha512sums=('341d8fa6ba452d529943731e9559ae0ebb573ccb574a46ab1d59d31b83e6af87ccd5237be9935a9022f100bfe88808ff8c6be3bf8147b21d4a7064ec31f31a28'
            '2e2291b727605b9362acddb09026264939f01222fdc244cd0a49ad7843d26ba69418d6d484265bae7ea535a6e4515dde429ca7fa2a693e98087320ba1087039e'
            '51dd56ffa9d6f21f829cdee7f75602f14769ad5ffdd89e4c1700ad0bfd393224a179fcd6cb58a8f94015860d1113047f8058883ee8479a9147666da64576cf39'
            '68205ffc60327c67a5ebe778598c3350d64b48aad9dacf52fcde435a535a074ba2056db30dff1b18e3c8e38510acd6ececa298b13cd4c4203636560fa4cf70cb')

prepare() {
    mkdir -p neoforge-server || exit
}

build() {
    java -jar "./neoforge-${pkgver}-installer.jar" --installServer ./neoforge-server
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm444 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d "${pkgdir}/${_srvpath}/${pkgname}"
    install -Dm644 "eula.txt" "${pkgdir}/${_srvpath}/${pkgname}"
    cp -r "./${pkgname}" "${pkgdir}/${_srvpath}"
    rm "${pkgdir}/${_srvpath}/${pkgname}/run.bat"
    install -Dm644 "${srcdir}/neoforge-server.service" "${pkgdir}/usr/lib/systemd/system/neoforge-server.service"
}
