# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail.com>

_pkgname=magma-server
_gamever=1.19.3
pkgname=${_pkgname}-${_gamever%.*}
pkgver=44.1.23
pkgrel=1
_rev=3a0ff713
_mng_ver=1.0.2
pkgdesc="Magma is the next generation of hybrid minecraft server softwares"
arch=('any')
url="https://magmafoundation.org/"
license=('custom')
depends=('java-runtime-headless>=16' 'tmux' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
makedepends=("gettext")
conflicts=()
backup=("etc/conf.d/magma-${_gamever%.*}")
install="${pkgname}.install"
# See https://launchermeta.mojang.com/mc/game/version_manifest.json for a list of all releases
source=("${pkgname}-${pkgver}-${_rev}.jar"::"https://git.magmafoundation.org/api/v4/projects/103/packages/maven/org/magmafoundation/Magma/${_gamever}-${pkgver}-${_rev}/Magma-${_gamever}-${pkgver}-${_rev}-server.jar"
	"minecraft-server-${_mng_ver}.tar.gz"::"https://github.com/Edenhofer/minecraft-server/archive/refs/tags/v${_mng_ver}.tar.gz")
noextract=("${pkgname}-${pkgver}-${_rev}.jar")
sha512sums=('6d0d4e0461243a6862ca19123f62b5058157f318d74a6971c5c6e9bff2837cb84d2fc4a6d8d513163e5742a4df74ef498ed48454ae837fb2eb8ecc571280af9d'
            '11d708d511b63e5541bcc1dbcaf29abbf7cb9583b1d313028770a39b26b41d48dcba023f7e1d6fe30f3c093d20e10a43363011edd432e5785a4580e5c5f852a6')

_game="magma-${_gamever%.*}"
_user="${_game//./-}"
_server_root="/srv/magma-${_gamever%.*}"

prepare() {
	export _game
	export _user
	export _server_root
	envsubst < "${startdir}/${pkgname}.install.tmpl" > "${startdir}/${pkgname}.install"
}

build() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" clean

	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		GAME=${_game} \
		INAME=${_game}d \
		SERVER_ROOT=${_server_root} \
		BACKUP_PATHS="world world_nether world_the_end" \
		GAME_USER=${_user} \
		SESSION_NAME="magma" \
		MAIN_EXECUTABLE="${_pkgname}.jar" \
		SERVER_START_CMD="java -Xms512M -Xmx1024M -jar ./${_pkgname}.jar nogui" \
		all
}

package() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		DESTDIR="${pkgdir}" \
		GAME=${_game} \
		INAME=${_game}d \
		install

	install -Dm644 "${pkgname}-${pkgver}-${_rev}.jar" "${pkgdir}${_server_root}/${pkgname}-${pkgver}.jar"
	# Link server jar file
	ln -s "${pkgname}-${pkgver}.jar" "${pkgdir}${_server_root}/${_pkgname}.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
