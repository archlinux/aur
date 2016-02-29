# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Contributer: Philip Abernethy <chais.z3r0@gmail.com>
# Contributer: sowieso <sowieso@dukun.de>

pkgname=minecraft-server
pkgver=1.9
pkgrel=1
pkgdesc="Minecraft server unit files, script, and jar"
arch=('any')
url="http://minecraft.net/"
license=('custom')
depends=('java-runtime-headless' 'screen' 'sudo' 'bash')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
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
md5sums=('ff68834eee875bcf367422c67673207c'
         'f75c76446f96311563e87fc688148501'
         'fef6fadd0739ae03ff71ba61025be207'
         'cab358c32dd0d4d2463e60ee2996f658'
         '54438e0c47cc5083e0a4376688b46092'
         '59bf34cc34f61fc36824620bf5e7f2fd')

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
