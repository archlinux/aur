# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
pkgname=spigot
pkgver=1.8.8
pkgrel=5
pkgdesc="High performance Minecraft server implementation"
arch=(any)
url="http://www.spigotmc.org/"
license=("LGPL")
depends=(java-runtime-headless screen sudo fontconfig bash)
makedepends=(java-environment git)
optdepends=("tar: needed in order to create world backups")
conflicts=(bukkit craftbukkit spigot-patcher)
provides=(bukkit "craftbukkit=${pkgver%_*}" "minecraft-server=${pkgver%_*}")
install=${pkgname}.install
source=("https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
        "${pkgname}-backup.service"
        "${pkgname}-backup.timer"
        "${pkgname}.service"
        "${pkgname}.conf"
        "${pkgname}.sh")
noextract=("BuildTools.jar")
md5sums=('SKIP'
         'fd17202ba0bb7796439f0b2f6bc53be4'
         '774cd44ed90f6be51d368533cf74d7c2'
         '580c470c92d88ae2362250d59bd33b10'
         '12a49f9b4ba6e5f4887555af0947949b'
         '528b26d2326fe92d96d29d8b615c9d6d')
backup=("etc/conf.d/${pkgname}")

build() {
	export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=1g"
	java -jar BuildTools.jar --rev $pkgver
}
package() {
	install -Dm644 ${pkgname}.conf              "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm755 ${pkgname}.sh                "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ${pkgname}-${pkgver}.jar     "${pkgdir}/srv/craftbukkit/${pkgname}.jar"
	install -Dm644 ${pkgname}.service           "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 ${pkgname}-backup.service    "${pkgdir}/usr/lib/systemd/system/${pkgname}-backup.service"
	install -Dm644 ${pkgname}-backup.timer      "${pkgdir}/usr/lib/systemd/system/${pkgname}-backup.timer"
}

# vim:set ts=2 sw=2 et:
