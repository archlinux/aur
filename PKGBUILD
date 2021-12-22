# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

_pkgname=cuberite
pkgname=cuberite-bin
_pkgver=1.12.2
_build_i686=303
_build_x86_64=293
_build_armv7h=299
pkgver="${_pkgver}b${_build_x86_64}"
pkgrel=3
_mng_ver=1.0.0
pkgdesc="A Minecraft-compatible multiplayer game server that is written in C++ and designed to be efficient with memory and CPU, as well as having a flexible Lua Plugin API. It is compatible with the vanilla Minecraft client."
arch=('i686' 'x86_64' 'armv7h')
url="https://cuberite.org/"
license=('Apache')
depends=('lua' 'tmux' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
provides=("minecraft-server=${_pkgver%_*}" "spigot=${_pkgver%_*}" "cuberite=${_pkgver}")
conflicts=("cuberite")
backup=('etc/conf.d/cuberite')
install="${_pkgname}.install"
source=("minecraft-server-${_mng_ver}.tar.gz"::"https://github.com/Edenhofer/minecraft-server/archive/refs/tags/v${_mng_ver}.tar.gz")
source_i686=("Cuberite.b${_build_i686}_i686.tar.gz"::"https://builds.cuberite.org/view/all/job/linux-i386/${_build_i686}/artifact/Cuberite.tar.gz")
source_x86_64=("Cuberite.b${_build_x86_64}_x86_64.tar.gz"::"https://builds.cuberite.org/view/all/job/linux-x86_64/${_build_x86_64}/artifact/Cuberite.tar.gz")
source_armv7h=("Cuberite.b${_build_armv7h}_armv7h.tar.gz"::"https://builds.cuberite.org/view/all/job/linux-armhf/${_build_armv7h}/artifact/Cuberite.tar.gz")
sha512sums=('e315277da81cb28de338e870f477dc58dc9d8f8542594431ab5321150c92ff5634ace2be8c6778d1edb718fdeb6850d7021bffcbd3cae2a00f20e3a64caa3d92')
sha512sums_i686=('c4efbafaddbfde10681ddc7b7f577f71a4e61f3ece64fcbf8a34932094c9cddbda853ea036b54c1212afc7e9d80984491eb09a2c443881f3dd934a1bcb223178')
sha512sums_x86_64=('09109462e490b71614629a613237644934558e72cb01f4e92c3258b0457ddd4f0c79209c3fb8a88064273cabfa6a84f92ef2e3207eeb2d53e7b32d4d2aa66dee')
sha512sums_armv7h=('ce6016891767265ed8f6fe1c89e901b1ade238af3418fb408445d3e9bac333421b0dcaf06199734dabbc34198ed6f0f1128f3289df0a0a39c52804ecf3b7aa2c')
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

build() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" clean

	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		GAME=${_game} \
		MYNAME=${_game} \
		SERVER_ROOT=${_server_root} \
		BACKUP_PATHS="world world_nether world_the_end" \
		GAME_USER=${_game} \
		MAIN_EXECUTABLE=Cuberite \
		SERVER_START_CMD="./Cuberite" \
		SERVER_START_SUCCESS="complete" \
		all
}

package() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		DESTDIR="${pkgdir}" \
		GAME=${_game} \
		MYNAME=${_game} \
		install

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
