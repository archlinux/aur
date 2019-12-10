# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=cuberite
_pkgver=1.12
_build_i686=1036
_build_x86_64=1061
_build_arm=1018
pkgver="${_pkgver}b${_build_x86_64}"
pkgrel=1
pkgdesc="A Minecraft-compatible multiplayer game server that is written in C++ and designed to be efficient with memory and CPU, as well as having a flexible Lua Plugin API. It is compatible with the vanilla Minecraft client."
arch=('i686' 'x86_64' 'armv7h')
url="https://cuberite.org/"
license=('Apache')
depends=('lua' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
provides=("minecraft-server=${_pkgver%_*}" "spigot=${_pkgver%_*}")
backup=('etc/conf.d/cuberite')
install="${pkgname}.install"
source=("${pkgname}-backup.service"
	"${pkgname}-backup.timer"
	"${pkgname}.service"
	"${pkgname}.conf"
	"${pkgname}.sh")
source_i686=("Cuberite.b${_build_i686}_i686.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20x86%20Master/${_build_i686}/artifact/Cuberite.tar.gz")
source_x86_64=("Cuberite.b${_build_x86_64}_x86_64.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/${_build_x86_64}/artifact/Cuberite.tar.gz")
source_armv7h=("Cuberite.b${_build_arm}_armhf.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20raspi-armhf%20Master/${_build_arm}/artifact/Cuberite.tar.gz")
sha512sums=('4a84419f3a532d2c34cef0a77cd30dded10a771b9d89e7d9d2b2af18808ff037dba68f84331a24ace5cb8c47436fe781b97b5d8a600127161ca55aaca07ecbae'
            '2ae834c75dfc299e823308bcb500e028020f1ac47675c645c4a7832ae225f63e9f7d22c08cd1bbb754388db7cf57ab3d4c359615be70f8d234e82013c148b024'
            'afc35227b91bc302e095c84c30ee85114e4b97220e8ee6acf8e7250306bee969e2cd4d57b4d2afd1e43298b32fc7ecaa543bdf6fead8c0f218cfc37aa51b524e'
            '9282301a67a612a4b757324274b6deea16d57e919b3c367a92414d7b74fe0ec4f5e54748ccf0ff14f6c62e8dbc5cb211afebfff8ad5abe63945afccf9484378f'
            '7e762bf68cb77eeb87c6221d4977198b70c86c842480301b8088a963a73bccbd2eeac84fab9fd82bf1b75c3743145a58500cb49e93de345e7b40912e14f57b5b')
sha512sums_i686=('f3e416da4ed2b5758d70674e1fb38f45020ddf17ccb29bcfee96781370d5a49cf74f3ac4c738d7416834f8c1586c13bde89f9721f9f129880357cc90ac8c13ff')
sha512sums_x86_64=('22e136aaa81bbccb8e6e42fc48474dbe37b84984bd8b2c5d6ceb1fdce3d96c29bf62fbffa871b3a38c33691de94406b5205abd6f199fa0904cd785157a41f578')
sha512sums_armv7h=('2012beecb970d6879ac7d8b8ffe74a6f183da6ae193154130d8a26f10f7dc59f53d50016108f54ae727a442adea6ab07293ba25ead1724cc38238c218b069378')

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
