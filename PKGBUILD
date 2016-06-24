# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=cuberite
pkgver=1.9.4
_build=501
_build_arm=472
pkgrel=3
pkgdesc="A Minecraft-compatible multiplayer game server that is written in C++ and designed to be efficient with memory and CPU, as well as having a flexible Lua Plugin API. It is compatible with the vanilla Minecraft client."
arch=('i686' 'x86_64' 'armv7h')
url="http://cuberite.org/"
license=('Apache')
depends=('lua' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
provides=("minecraft-server=${pkgver%_*}" "spigot=${pkgver%_*}")
backup=('etc/conf.d/cuberite')
install="${pkgname}.install"
source=("${pkgname}-backup.service"
	"${pkgname}-backup.timer"
	"${pkgname}.service"
	"${pkgname}.conf"
	"${pkgname}.sh")
source_i686=("Cuberite.b${_build}_i686.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20x86%20Master/${_build}/artifact/Cuberite.tar.gz")
source_x86_64=("Cuberite.b${_build}_x86_64.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/${_build}/artifact/Cuberite.tar.gz")
source_armv7h=("Cuberite.b${_build}_armhf.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20raspi-armhf%20Master/${_build_arm}/artifact/Cuberite.tar.gz")
md5sums=('262b66be8e102bbd171c2b3057f6634c'
         '312b38afb20c4fb38c260fd6ef8cf138'
         '286800e1783006675d0fec31f566c328'
         'c3cebfdaf3c29ca759975dc2923d7ff0'
         'c77fae02ab00804b05195940751be143')
md5sums_i686=('c15e6bfabfa63a02be4086526747edc4')
md5sums_x86_64=('4ae501f84c2f1a701c83fa177ad5e2e8')
md5sums_armv7h=('52f9ecbbebea7797133445764d663bfc')

_game="cuberite"
_server_root="/srv/cuberite"

package() {
	install -Dm644 ${_game}.conf              "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 ${_game}.sh                "${pkgdir}/usr/bin/${_game}"
	install -Dm644 ${_game}.service           "${pkgdir}/usr/lib/systemd/system/${_game}.service"
	install -Dm644 ${_game}-backup.service    "${pkgdir}/usr/lib/systemd/system/${_game}-backup.service"
	install -Dm644 ${_game}-backup.timer      "${pkgdir}/usr/lib/systemd/system/${_game}-backup.timer"

	# Copy files from the archive to the server destination and create some dirs
	mkdir -p "${pkgdir}/${_server_root}/backup"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	cp -dpr --no-preserve=ownership Server/. "${pkgdir}/${_server_root}"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
