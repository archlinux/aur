# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=cuberite
_pkgver=1.9.4
_build_i686=712
_build_x86_64=712
_build_arm=688
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
            'e9a452e2c674ec177bf8fec3a798088628fbdde9141ae3151071cd6b2b72ff6fc1983ea8bd5fa3aeaa6706f8b29fe82813e2a3717a9b1800ecd478b4c3abac8f'
            '9282301a67a612a4b757324274b6deea16d57e919b3c367a92414d7b74fe0ec4f5e54748ccf0ff14f6c62e8dbc5cb211afebfff8ad5abe63945afccf9484378f'
            'd529d2c97e7284964c21ce1e1a6652af6742c0339000574668931a653070a7f395d9f517a84a5d07df6949295086fb7c3d2ac26c5058700b96401af8ae7c71f5')
sha512sums_i686=('7e25544450c598a091a6bba6786aee946e8e2281184759a6c692c8cb77552fb182e15aa224261d6be62a8d5b263791f488a83fa618ff95eda44f807022809856')
sha512sums_x86_64=('3222e675086c0986d478092afd90d964fd3a5cc3bd0ad79b15b7e66c8a7cc6912a75637f1efdb53dd740ccb42354531496a65eb7bcd19b735a310ccd14e04e1a')
sha512sums_armv7h=('36a857d927b2d243be1ff6099d4d51f179086cfc45aef272c67855b23cff462413c8f5818925a728b6b32ad314452d976dc5f94b26b56a29a1abecb65ca18243')

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
