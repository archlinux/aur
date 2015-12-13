# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Contributer: Philip Abernethy <chais.z3r0@gmail.com>

pkgname=minecraft-server
pkgver=1.8.8
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
md5sums=('a0671390aa0691e70a950155aab06ffb'
	'2cf6cdf65e0ed6aa6d452943b1e84357'
	'c644abdf293c2f98033a64d732a4945c'
	'5ed78e366146e47f8498347e93ad5423'
	'd4656f27716fd78ab64344a517b07443'
	'1991eb0aedeba1dab2371f22a6736b47')

package() {
	install -Dm644 minecraftd.conf              "${pkgdir}/etc/conf.d/minecraft"
	install -Dm755 minecraftd.sh                "${pkgdir}/usr/bin/minecraftd"
	install -Dm644 minecraftd.service           "${pkgdir}/usr/lib/systemd/system/minecraftd.service"
	install -Dm644 minecraftd-backup.service    "${pkgdir}/usr/lib/systemd/system/minecraftd-backup.service"
	install -Dm644 minecraftd-backup.timer      "${pkgdir}/usr/lib/systemd/system/minecraftd-backup.timer"
	install -Dm644 minecraft_server.${pkgver}.jar "${pkgdir}/srv/minecraft/minecraft_server.${pkgver}.jar"
	ln -s "minecraft_server.${pkgver}.jar" "${pkgdir}/srv/minecraft/minecraft_server.jar"

	mkdir -p "${pkgdir}/var/log/"
	ln -s "/srv/minecraft/logs" "${pkgdir}/var/log/minecraft" #&>/dev/null
}
