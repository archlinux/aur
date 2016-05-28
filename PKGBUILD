# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=cuberite
pkgver=1.9.4
_build=487
pkgrel=1
pkgdesc="A Minecraft-compatible multiplayer game server that is written in C++ and designed to be efficient with memory and CPU, as well as having a flexible Lua Plugin API. It is compatible with the vanilla Minecraft client."
arch=('i686' 'x86_64')
url="http://cuberite.org/"
license=('Apache')
depends=('bash' 'lua')
optdepends=("tar: needed in order to create backups")
provides=("minecraft-server=${pkgver%_*}" "spigot=${pkgver%_*}" "craftbukkit=${pkgver%_*}")
install="${pkgname}.install"
source=("${pkgname}-backup.service"
	"${pkgname}-backup.timer"
	"${pkgname}.service")
source_i686=("Cuberite.b${_build}_i686.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20x86%20Master/${_build}/artifact/Cuberite.tar.gz")
source_x86_64=("Cuberite.b${_build}_x86_64.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/${_build}/artifact/Cuberite.tar.gz")
md5sums=('0274b8d53cbc31afdcb91c0dd07229af'
         '312b38afb20c4fb38c260fd6ef8cf138'
         'f8b9283beab5c3026cb13a4c43c119da')
md5sums_i686=('6188b17d47f3c32d73a0aa66bd92afb7')
md5sums_x86_64=('49e4f716a7c14dd9f25502e3ee5ef9aa')

_game="cuberite"
_server_root="/srv/cuberite"

package() {
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
