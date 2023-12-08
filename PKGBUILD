# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

_pkgname=cuberite
pkgname=cuberite-bin
_pkgver=1.12.2
_build_i686=394
_build_x86_64=385
_build_armv7h=391
pkgver="${_pkgver}b${_build_x86_64}"
pkgrel=1
_mng_ver=1.0.3
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
sha512sums=('1cc15371d8fad39ef8812059463dd92b91628ff3887bd0eb462d919cd3b2a948c4c3535f701bf4912de3e9c84b2333738f4dd63202f235b1726e79ed178fe156')
sha512sums_i686=('c39411905c3c7187c096a6d3eeb0fddc884da0c99f7bb65097ff1aa79efa5e3abde8c47572ecb829103db225d01ab715d751ea3b97e0c004e5cf32f0be99ceb5')
sha512sums_x86_64=('5495874b70a3bee5302116573dd0637996001a1625b38091c98b76cd1b45d51bd8257a59222a74a9a14bd07a2af6e06b10f53bbfefff0255ea6afe70d546bdf7')
sha512sums_armv7h=('9f2262d78aff05394cab31bfb242e17de0dfa2d72c827fcf9c33c223d8c131861b474b512d2189783d868697eddb16a4cd20bdbfa68612c5f87576daeb596d0a')
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
		INAME=${_game} \
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
		INAME=${_game} \
		install

	# Copy files from the archive to the server destination and create some dirs
	mkdir -p "${pkgdir}/${_server_root}/backup"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	cp -dpr --no-preserve=ownership Server/. "${pkgdir}/${_server_root}"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+s "${pkgdir}${_server_root}"
}
