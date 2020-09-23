# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=cuberite
_pkgver=1.12.2
_build_i686=71
_build_x86_64=65
_build_armv7h=67
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
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	"${pkgname}.conf"
	"${pkgname}.sh")
source_i686=("Cuberite.b${_build_i686}_i686.tar.gz"::"https://builds.cuberite.org/view/all/job/linux-i386/${_build_i686}/artifact/Cuberite.tar.gz")
source_x86_64=("Cuberite.b${_build_x86_64}_x86_64.tar.gz"::"https://builds.cuberite.org/view/all/job/linux-x86_64/${_build_x86_64}/artifact/Cuberite.tar.gz")
source_armv7h=("Cuberite.b${_build_armv7h}_armv7h.tar.gz"::"https://builds.cuberite.org/view/all/job/linux-armhf/${_build_armv7h}/artifact/Cuberite.tar.gz")
sha512sums=('4b4161558343dd2ec4d6b2be41b958e061df2a41961d9476ac1d38f28530043f99735d20115ba65bdbdc04003582f3ab8beb00b19623aae72ecab81797eb05dc'
            '2ae834c75dfc299e823308bcb500e028020f1ac47675c645c4a7832ae225f63e9f7d22c08cd1bbb754388db7cf57ab3d4c359615be70f8d234e82013c148b024'
            'afc35227b91bc302e095c84c30ee85114e4b97220e8ee6acf8e7250306bee969e2cd4d57b4d2afd1e43298b32fc7ecaa543bdf6fead8c0f218cfc37aa51b524e'
            '23bed9e9b495ebba49f3f75a193844135657e670a751df285117588b7991fe1b3de011b32181d71f071f76d5bfa9324ac5ac459870f06435b7d6665f319354bb'
            '021d27ff53f60ded48dcecf0f11b060bcb791b3f3d0ba243c9f16c6d491f40820455da0c81049c8b782d9362ee65a9822242ca6931b74845a74b6e3bae5c976b'
            '9282301a67a612a4b757324274b6deea16d57e919b3c367a92414d7b74fe0ec4f5e54748ccf0ff14f6c62e8dbc5cb211afebfff8ad5abe63945afccf9484378f'
            '3530a726b4b598690718b2f769ca68761c9956867549ed9fe173cf556fd55ed681da26c9bb2aa25e934cc1daa7cd010003ef82d1d215412f558fa7bbc44d24b6')
sha512sums_i686=('c92b3201bbfbda59e002062e39e4c63c4b8cefc824d57af07e5b31929a150716940633bc211b24047e5be3fa6a689539507b05e0b2afdb6ad77d1b86777ece3f')
sha512sums_x86_64=('f27687561789a3c21464f568ca531e463eb4235189b5cc13a3a10b5ad864e1f318d0806a53e1812160d01efed99722dd2485a8ae2a405669be07854ee958f7eb')
sha512sums_armv7h=('a17e8d83f4c418d268131891d5e0d0f2bb89d3b4ee054db1bb7ee9a24531c0fa875cd5e87a867a87e15988f398809cf935b3e63bc808994f291c84a0dfb6d44b')
noextract=("Cuberite.b${_build_i686}_i686.tar.gz"
	"Cuberite.b${_build_x86_64}_x86_64.tar.gz"
	"Cuberite.b${_build_armv7h}_armv7h.tar.gz")

_game="cuberite"
_server_root="/srv/cuberite"

prepare() {
	rm -rf Server
	mkdir -p Server
	_build="_build_${CARCH}"
	bsdtar -xf "Cuberite.b${!_build}_${CARCH}.tar.gz" -C Server
}

package() {
	install -Dm644 ${_game}.conf              "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 ${_game}.sh                "${pkgdir}/usr/bin/${_game}"
	install -Dm644 ${_game}.service           "${pkgdir}/usr/lib/systemd/system/${_game}.service"
	install -Dm644 ${_game}-backup.service    "${pkgdir}/usr/lib/systemd/system/${_game}-backup.service"
	install -Dm644 ${_game}-backup.timer      "${pkgdir}/usr/lib/systemd/system/${_game}-backup.timer"
	install -Dm644 ${_game}.sysusers          "${pkgdir}/usr/lib/sysusers.d/${_game}.conf"
	install -Dm644 ${_game}.tmpfiles          "${pkgdir}/usr/lib/tmpfiles.d/${_game}.conf"

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
