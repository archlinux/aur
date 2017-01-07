# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=cuberite
pkgver=1.9.4
_build_i686=579
_build_x86_64=578
_build_arm=556
pkgrel=6
pkgdesc="A Minecraft-compatible multiplayer game server that is written in C++ and designed to be efficient with memory and CPU, as well as having a flexible Lua Plugin API. It is compatible with the vanilla Minecraft client."
arch=('i686' 'x86_64' 'armv7h')
url="https://cuberite.org/"
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
source_i686=("Cuberite.b${_build_i686}_i686.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20x86%20Master/${_build_i686}/artifact/Cuberite.tar.gz")
source_x86_64=("Cuberite.b${_build_x86_64}_x86_64.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/${_build_x86_64}/artifact/Cuberite.tar.gz")
source_armv7h=("Cuberite.b${_build_arm}_armhf.tar.gz"::"https://builds.cuberite.org/job/Cuberite%20Linux%20raspi-armhf%20Master/${_build_arm}/artifact/Cuberite.tar.gz")
sha512sums=('4a84419f3a532d2c34cef0a77cd30dded10a771b9d89e7d9d2b2af18808ff037dba68f84331a24ace5cb8c47436fe781b97b5d8a600127161ca55aaca07ecbae'
            '2ae834c75dfc299e823308bcb500e028020f1ac47675c645c4a7832ae225f63e9f7d22c08cd1bbb754388db7cf57ab3d4c359615be70f8d234e82013c148b024'
            'e9a452e2c674ec177bf8fec3a798088628fbdde9141ae3151071cd6b2b72ff6fc1983ea8bd5fa3aeaa6706f8b29fe82813e2a3717a9b1800ecd478b4c3abac8f'
            '9282301a67a612a4b757324274b6deea16d57e919b3c367a92414d7b74fe0ec4f5e54748ccf0ff14f6c62e8dbc5cb211afebfff8ad5abe63945afccf9484378f'
            '3710f8601dff844c4f1de3e3e3da835f5b0a89df5efaa3fc76ed7e8686b39eb870e5605389623d140782fdebbbe356dc753c2c64e8c5ffc6f76306d86657db16')
sha512sums_i686=('08e125160c8cd61d05d6e290a00ea40a0c0422671fbd61101382d94f096307ed155d25d1ec72d25588fcc7df63d0419b609edddd2a39b93c4fdd0fb8cada75b7')
sha512sums_x86_64=('8b1f70d6842cc65cd86f18db7fc8372410be6744777efa03c363e73e3046e37230cee4e8fe7ed2e49bc8fde42bdb012340704d042c3795391b688fcaa1fb397c')
sha512sums_armv7h=('4b931c8d1d4e95ab7eac919cae863098f1c4e27f30cc79547c5ab2a9dee281d7702f486ea9bcef94ca812f94cba1c6fcf0bfe7343f4ff8dfabe8646d3db4b6bd')

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
