# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

_pkgname=cuberite
pkgname=cuberite-bin
_pkgver=1.12.2
_build_i686=387
_build_x86_64=378
_build_armv7h=384
pkgver="${_pkgver}b${_build_x86_64}"
pkgrel=1
_mng_ver=1.0.2
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
sha512sums=('11d708d511b63e5541bcc1dbcaf29abbf7cb9583b1d313028770a39b26b41d48dcba023f7e1d6fe30f3c093d20e10a43363011edd432e5785a4580e5c5f852a6')
sha512sums_i686=('f0796d1efee85d8782f90db15afd3cf9fd092baeed4836a6fccd8a988a91b16f942742348eeffa7aa8ee1b6a3eea6ad17aae2af6c1d75d190a24a50e63d55e21')
sha512sums_x86_64=('4acfc49a8f87a91c76295a04f2ddc099e41df9bf587c21e35bb416e6c4a6f4e1ad1b2fc3ec6337f3a5e1df329f6bd7a2372b8c1ff2e06df32387c71af0adf2f5')
sha512sums_armv7h=('ef55b1774af8dcaec605dee5f345859ec634ea3532e5f37a9e4636e6f4b77435f8f690bece0e10ae6624cd08aeb5d3e1320ec5442b852e186e96cffaf9fd88c4')
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
	chmod g+ws "${pkgdir}${_server_root}"
}
