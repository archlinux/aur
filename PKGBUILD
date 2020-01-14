# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=cuberite
_pkgver=1.12
_build_i686=1059
_build_x86_64=1065
_build_arm=1022
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
sha512sums=('4b4161558343dd2ec4d6b2be41b958e061df2a41961d9476ac1d38f28530043f99735d20115ba65bdbdc04003582f3ab8beb00b19623aae72ecab81797eb05dc'
            '2ae834c75dfc299e823308bcb500e028020f1ac47675c645c4a7832ae225f63e9f7d22c08cd1bbb754388db7cf57ab3d4c359615be70f8d234e82013c148b024'
            'afc35227b91bc302e095c84c30ee85114e4b97220e8ee6acf8e7250306bee969e2cd4d57b4d2afd1e43298b32fc7ecaa543bdf6fead8c0f218cfc37aa51b524e'
            '9282301a67a612a4b757324274b6deea16d57e919b3c367a92414d7b74fe0ec4f5e54748ccf0ff14f6c62e8dbc5cb211afebfff8ad5abe63945afccf9484378f'
            '3530a726b4b598690718b2f769ca68761c9956867549ed9fe173cf556fd55ed681da26c9bb2aa25e934cc1daa7cd010003ef82d1d215412f558fa7bbc44d24b6')
sha512sums_i686=('7aae57b8ac6a8c059700b859900d6846e62bf7f443a1bcb98b776aa8fd5a93847bdc970449d1e5436053d85bc035ac4a845a1dfcce007b3b70065fa21d98d61f')
sha512sums_x86_64=('52cc05436a8f8c76369848315bc3615805fdc89571e9187b860a46c96b79c5411e9f7bd33190979551bd48f6a083d07fa69ba4c11a161bc6cd0748abeac86b06')
sha512sums_armv7h=('9b91f1adf4fd85bc1c8723577bbb25e7bda385e968a5e76ca94553c06b5a0344d67952797a9ec47adbd10eb6252ad7bcf9ffb44ae3b602952d667a4a5f2a1cb7')

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
