# Maintainer: Johannes Joens <johannes@joens.email>
# Contributer: Misterio <eu@misterio.me>
# Contributer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributer: Philip Abernethy <chais.z3r0@gmail.com>
# Contributer: sowieso <sowieso@dukun.de>

pkgname=waterfall
pkgver=403
pkgrel=2
mcver=1.16
pkgdesc="A fork of BungeeCord to improve performance and stability."
arch=('any')
url="https://papermc.io/"
license=('custom')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"nmap-netcat: required in order to suspend an idle server")
backup=('etc/conf.d/waterfall')
install="${pkgname}.install"
_subserver=proxy

source=("${pkgname}.${pkgver}.jar"::"https://papermc.io/api/v2/projects/waterfall/versions/${mcver}/builds/${pkgver}/downloads/waterfall-${mcver}-${pkgver}.jar"
	"${pkgname}-backup@.service"
	"${pkgname}-backup.timer"
	"${pkgname}@.service"
	"${pkgname}.conf"
	"${pkgname}.sh"
        "${_subserver}.conf"
        "LICENSE"::"https://raw.githubusercontent.com/PaperMC/Waterfall/master/LICENSE.txt")

noextract=("${pkgname}.${pkgver}.jar")

_server_root="/srv/waterfall"

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
         '4c718e2d8aab760d4e2c2d66d262485e'
         'e43edd4fa467326c2fd7606fb336350c'
         'd2b077821aa4bb08236a2ff110dd5d6a'
         'eead14ee047e6635005177e59d132a43'
         'aeba0d41f95979d34a3c33107d50e54a'
         '7e394351b749f9e7bbd8ea60f4768c1b'
         'SKIP')
