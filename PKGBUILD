# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Contributer: Philip Abernethy <chais.z3r0@gmail.com>

pkgname=minecraft-server
pkgver=1.8.9
pkgrel=2
pkgdesc="Minecraft server unit files, script, and jar"
arch=('any')
url="http://minecraft.net/"
license=('custom')
depends=('java-runtime-headless' 'screen' 'sudo' 'bash')
optdepends=('tar: needed in order to create world backups')
conflicts=('minecraft-server-systemd' 'minecraft-canary')
options=(!strip)
install=${pkgname}.install
backup=('etc/conf.d/minecraft')
source=("https://s3.amazonaws.com/Minecraft.Download/versions/${pkgver}/minecraft_server.${pkgver}.jar"
	"minecraftd-backup.service"
	"minecraftd-backup.timer"
	"minecraftd.service"
	"minecraftd.conf"
	"minecraftd.sh")
noextract=("minecraft_server.${pkgver}.jar")
md5sums=('3acbaef956308c805e8e2d0a03a737e9'
         '2cf6cdf65e0ed6aa6d452943b1e84357'
         'c644abdf293c2f98033a64d732a4945c'
         '5ed78e366146e47f8498347e93ad5423'
         '8088e2b05ef4d85049dea41585a9070d'
         '4b9ee8074249619c01ca6e3672fc329e')

package() {
	install -Dm644 minecraftd.conf              "${pkgdir}/etc/conf.d/minecraft"
	install -Dm755 minecraftd.sh                "${pkgdir}/usr/bin/minecraftd"
	install -Dm644 minecraftd.service           "${pkgdir}/usr/lib/systemd/system/minecraftd.service"
	install -Dm644 minecraftd-backup.service    "${pkgdir}/usr/lib/systemd/system/minecraftd-backup.service"
	install -Dm644 minecraftd-backup.timer      "${pkgdir}/usr/lib/systemd/system/minecraftd-backup.timer"
	install -Dm644 minecraft_server.${pkgver}.jar "${pkgdir}/srv/minecraft/minecraft_server.${pkgver}.jar"
	ln -s "minecraft_server.${pkgver}.jar" "${pkgdir}/srv/minecraft/minecraft_server.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	ln -s "/srv/minecraft/logs" "${pkgdir}/var/log/minecraft" #&>/dev/null

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}/srv/minecraft"
}
