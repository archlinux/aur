# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
pkgname=spigot
pkgver=1.8.8
pkgrel=2
pkgdesc="High performance Minecraft server implementation"
arch=(any)
url="http://www.spigotmc.org/"
license=("LGPL")
depends=(java-runtime-headless screen sudo fontconfig bash)
makedepends=(java-environment git)
optdepends=("tar: needed in order to create world backups")
conflicts=(bukkit craftbukkit spigot-patcher)
provides=(bukkit "craftbukkit=${pkgver%_*}" minecraft-server)
install=${pkgname}.install
source=("https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
        "spigot-backup.service"
        "spigot-backup.timer"
        "spigot.service"
        "spigot.sh")
md5sums=('SKIP'
         'fd17202ba0bb7796439f0b2f6bc53be4'
         '774cd44ed90f6be51d368533cf74d7c2'
         '580c470c92d88ae2362250d59bd33b10'
         '17fede1d02736e0ee87d0b667cdf1525')
noextract=("BuildTools.jar")

build() {
	export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=1g"
	java -jar BuildTools.jar --rev $pkgver
}
package() {
  install -Dm755 spigot.sh                "${pkgdir}/usr/bin/spigot"
	install -Dm644 spigot-${pkgver}.jar     "${pkgdir}/srv/spigot/spigot.jar"
	install -Dm644 spigot.service           "${pkgdir}/usr/lib/systemd/system/spigot.service"
	install -Dm644 spigot-backup.service    "${pkgdir}/usr/lib/systemd/system/spigot-backup.service"
	install -Dm644 spigot-backup.timer      "${pkgdir}/usr/lib/systemd/system/spigot-backup.timer"
}

# vim:set ts=2 sw=2 et:
