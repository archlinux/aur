# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Contributer: Philip Abernethy <chais.z3r0@gmail.com>
# Contributer: sowieso <sowieso@dukun.de>

pkgname=minecraft-server
pkgver=1.9
pkgrel=8
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
         'b786935d6517d46fe0944377daba32b8'
         'fef6fadd0739ae03ff71ba61025be207'
         'afb84ad0316af0aca421b36eaa2bbd90'
         '00045683c06924d765ac14887218ffcc'
         '48cb57c426c7725483cd0c9af24048df')

_game="minecraft"
_server_root="/srv/minecraft"

package() {
	install -Dm644 minecraftd.conf              "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 minecraftd.sh                "${pkgdir}/usr/bin/${_game}d"
	install -Dm644 minecraftd.service           "${pkgdir}/usr/lib/systemd/system/${_game}d.service"
	install -Dm644 minecraftd-backup.service    "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.service"
	install -Dm644 minecraftd-backup.timer      "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.timer"
	install -Dm644 minecraft_server.${pkgver}.jar "${pkgdir}${_server_root}/minecraft_server.${pkgver}.jar"
	ln -s "minecraft_server.${pkgver}.jar" "${pkgdir}${_server_root}/minecraft_server.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
