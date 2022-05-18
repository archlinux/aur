# Maintainer: Johannes Joens <johannes@joens.email>
# Contributer: Misterio <eu@misterio.me>
# Contributer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributer: Philip Abernethy <chais.z3r0@gmail.com>
# Contributer: sowieso <sowieso@dukun.de>

pkgname=waterfall
_mcver=1.18
_build=486
pkgver=${_mcver}.${_build}
pkgrel=1
pkgdesc="A fork of BungeeCord to improve performance and stability."
arch=('any')
url="https://papermc.io/"
license=('custom')
depends=('java-runtime-headless>=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
makedepends=('jq')
optdepends=("tar: needed in order to create world backups"
	"nmap-netcat: required in order to suspend an idle server")
backup=('etc/conf.d/waterfall')
install="${pkgname}.install"
_subserver=proxy
source=("${pkgname}.${_build}.jar"::"https://papermc.io/api/v2/projects/waterfall/versions/${_mcver}/builds/${_build}/downloads/waterfall-${_mcver}-${_build}.jar"
	"${pkgname}-backup@.service"
	"${pkgname}-backup.timer"
	"${pkgname}@.service"
	"${pkgname}.conf"
	"${pkgname}.sh"
	"${_subserver}.conf"
	"LICENSE"::"https://raw.githubusercontent.com/PaperMC/Waterfall/master/LICENSE.txt")

noextract=("${pkgname}.${_build}.jar")

_server_root="/srv/waterfall"

package() {
	install -Dm644 ${pkgname}.conf            "${pkgdir}/etc/conf.d/${pkgname}"
	install -Dm755 ${pkgname}.sh              "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ${pkgname}@.service        "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
	install -Dm644 ${pkgname}-backup@.service "${pkgdir}/usr/lib/systemd/system/${pkgname}-backup@.service"
	install -Dm644 ${pkgname}-backup.timer    "${pkgdir}/usr/lib/systemd/system/${pkgname}-backup.timer"
	install -Dm644 ${_subserver}.conf         "${pkgdir}${_server_root}/servers/${_subserver}.conf"
	install -Dm644 ${pkgname}.${_build}.jar   "${pkgdir}${_server_root}/servers/${_subserver}/${pkgname}.${_build}.jar"
	ln -s "${pkgname}.${_build}.jar"          "${pkgdir}${_server_root}/servers/${_subserver}/server.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/servers/${_subserver}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${pkgname}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"

	install -D ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('01d131e63a1ed68b0638d0c5ece2716e2a0e1e39d908bcbda9d58bbdf5a80b2f'
            'd4d7db9a2265b53437b5328d4df4eda4e993a3c0a9557e2da7d490b0d9c64039'
            '086bf54f2c17ed11669fd3b4766a42b513db832d78ad10bb0bfebb24b715f8f6'
            'cf2aa39e1cbdfd9a40667cfa577437c8d2a35ce74320257bcdda3e6cd5ec1a31'
            'bdc7bf948d1516735bb5eb761506c45bd1cfa000041de8955604eee6f8273e50'
            '1301e6cb9737d19ce93086539578917f7fc26f711c4b8328c83117464f979657'
            '5d2b7d2ce8b1c7694e299b5f7b07e5ef9b014d4800235e31d0cbe189a48bd1ac'
            '5cd2fc4aff03d515b9689197a835c7923c10123b0a30c08d61828beac817be04')
