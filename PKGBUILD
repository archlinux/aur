# Maintainer: Johannes Joens <johannes@joens.email>
# Contributer: Misterio <eu@misterio.me>
# Contributer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributer: Philip Abernethy <chais.z3r0@gmail.com>
# Contributer: sowieso <sowieso@dukun.de>

pkgname=bungeecord
pkgver=1549
pkgrel=6
pkgdesc="BungeeCord is a sophisticated proxy and API designed mainly to teleport players between multiple Minecraft servers."
arch=('any')
url="https://www.spigotmc.org/"
license=('custom')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"nmap-netcat: required in order to suspend an idle server")
backup=('etc/conf.d/bungeecord')
install="${pkgname}.install"
_subserver=proxy

source=("${pkgname}.${pkgver}.jar"::"https://ci.md-5.net/job/BungeeCord/${pkgver}/artifact/bootstrap/target/BungeeCord.jar"
	"${pkgname}-backup@.service"
	"${pkgname}-backup.timer"
	"${pkgname}@.service"
	"${pkgname}.conf"
	"${pkgname}.sh"
        "${_subserver}.conf"
        "LICENSE"::"https://raw.githubusercontent.com/SpigotMC/BungeeCord/master/LICENSE")

noextract=("${pkgname}.${pkgver}.jar")

_server_root="/srv/bungeecord"

package() {
	install -Dm644 ${pkgname}.conf            "${pkgdir}/etc/conf.d/${pkgname}"
	install -Dm755 ${pkgname}.sh              "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ${pkgname}@.service        "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
	install -Dm644 ${pkgname}-backup@.service "${pkgdir}/usr/lib/systemd/system/${pkgname}-backup@.service"
	install -Dm644 ${pkgname}-backup.timer    "${pkgdir}/usr/lib/systemd/system/${pkgname}-backup.timer"
        install -Dm644 ${_subserver}.conf       "${pkgdir}${_server_root}/servers/${_subserver}.conf"
	install -Dm644 ${pkgname}.${pkgver}.jar   "${pkgdir}${_server_root}/servers/${_subserver}/${pkgname}.${pkgver}.jar"
	ln -s "${pkgname}.${pkgver}.jar"          "${pkgdir}${_server_root}/servers/${_subserver}/server.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/servers/${_subserver}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${pkgname}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"

        install -D ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('SKIP'
         '5a8269dd7e7f29b5b66ec867867da6c3'
         '360e85e09794e41552bf257f4e655507'
         'de4e626d540090bc211349725eba4071'
         '1b12e11d8089fdb0a7ea4cd09d788467'
         'd08f160d1dff2b980312b1758aff586e'
         '68c2350a4584fb7c9b7edaa857e44761'
         'SKIP')
