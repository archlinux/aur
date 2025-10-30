# Maintainer: yuna0x0 <yuna@yuna0x0.com>

# Based on the 'papermc' AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=paper-velocity
# curl -X GET "https://api.papermc.io/v2/projects/velocity" -H  "accept: application/json"
_pkgver=3.4.0-SNAPSHOT
# curl -X GET "https://api.papermc.io/v2/projects/velocity/versions/${_pkgver}" -H  "accept: application/json"
_build=555
pkgver="${_pkgver//-/_}+b${_build}"
pkgrel=1
_mng_ver=1.0.0
pkgdesc="The modern, next-generation Minecraft server proxy."
arch=('any')
url="https://papermc.io/software/velocity"
license=('GPL-3.0-or-later')
depends=('java-runtime-headless>=16' 'tmux' 'sudo' 'bash' 'awk' 'sed')
optdepends=("netcat: required in order to suspend an idle server")
conflicts=('paper-velocity-git')
backup=('etc/conf.d/velocity')
install="${pkgname}.install"
source=("velocity.${pkgver}.jar"::"https://api.papermc.io/v2/projects/velocity/versions/${_pkgver}/builds/${_build}/downloads/velocity-${_pkgver}-${_build}.jar"
	"velocity-proxy-mgmt-${_mng_ver}.tar.gz"::"https://github.com/yuna0x0/velocity-proxy-mgmt/archive/refs/tags/v${_mng_ver}.tar.gz")
noextract=("velocity.${pkgver}.jar")
sha256sums=('c77b11066c004e6fc07132145994537155fbbbbd5580b7db7b123e0a387560e3'
            '5b22bc55f350382e5c6e2b88c4a51247316814eb73fe3e9b8a45a265d3619ac8')

_game="velocity"
_server_root="/srv/velocity"

build() {
	make -C "${srcdir}/velocity-proxy-mgmt-${_mng_ver}" clean

	make -C "${srcdir}/velocity-proxy-mgmt-${_mng_ver}" \
		GAME=${_game} \
		INAME=${_game} \
		SERVER_ROOT=${_server_root} \
		GAME_USER=${_game} \
		MAIN_EXECUTABLE=velocity.jar \
		SERVER_START_CMD="java -Xms1G -Xmx1G -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15 -jar ./velocity.jar" \
		all
}

package() {
	make -C "${srcdir}/velocity-proxy-mgmt-${_mng_ver}" \
		DESTDIR="${pkgdir}" \
		GAME=${_game} \
		INAME=${_game} \
		install

	install -Dm644 ${_game}.${pkgver}.jar     "${pkgdir}/${_server_root}/${_game}.${pkgver}.jar"
	ln -s "${_game}.${pkgver}.jar" "${pkgdir}${_server_root}/${_game}.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+s "${pkgdir}${_server_root}"
}
