# Maintainer: Johannes Joens <johannes@joens.email>
# Contributer: Misterio <eu@misterio.me>
# Contributer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributer: Philip Abernethy <chais.z3r0@gmail.com>
# Contributer: sowieso <sowieso@dukun.de>

pkgname=travertine
pkgver=175
pkgrel=2
mcver=1.16
pkgdesc="A fork of Waterfall to add 1.7, and other, protocol support."
arch=('any')
url="https://papermc.io/"
license=('custom')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"nmap-netcat: required in order to suspend an idle server")
backup=('etc/conf.d/travertine')
install="${pkgname}.install"
_subserver=proxy
source=("${pkgname}.${pkgver}.jar"::"https://papermc.io/api/v2/projects/travertine/versions/${mcver}/builds/${pkgver}/downloads/travertine-${mcver}-${pkgver}.jar"
	"${pkgname}-backup@.service"
	"${pkgname}-backup.timer"
	"${pkgname}@.service"
	"${pkgname}.conf"
	"${pkgname}.sh"
        "${_subserver}.conf"
        "LICENSE"::"https://raw.githubusercontent.com/PaperMC/Travertine/master/LICENSE.txt")

noextract=("${pkgname}.${pkgver}.jar")

_server_root="/srv/travertine"

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
         '75c5371cd975a49f9dc615699bafaf1d'
         '5adb94aa0f9386f4fa4864762d955df1'
         '46dfbd02f7b07d4a07af07d94374ef3b'
         'f9724d01ebddfa4c1c29cf148e931eb5'
         '692a4d273801300fec3bf1f1c11f4481'
         'e527a1cc406188d4d803e4f249bf7a71'
         'SKIP')
