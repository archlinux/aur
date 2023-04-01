# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail.com>

_pkgver=1.12.2
pkgname=magma-server-git
pkgver=1.12.2.r504.d04e549e
pkgrel=1
_mng_ver=1.0.2
pkgdesc="Magma is the next generation of hybrid minecraft server softwares"
arch=('any')
url="https://magmafoundation.org/"
license=('custom')
depends=('java-runtime=8' 'tmux' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
makedepends=('git' 'gettext' 'java-environment-openjdk=8')
conflicts=('magma-server')
provides=('magma-server')
backup=("etc/conf.d/magma-${_gamever%.*}")
install="${pkgname}.install"
# See https://launchermeta.mojang.com/mc/game/version_manifest.json for a list of all releases
source=(${pkgname}::"git+http://git.magmafoundation.org/magmafoundation/Magma.git"
	"minecraft-server-${_mng_ver}.tar.gz"::"https://github.com/Edenhofer/minecraft-server/archive/refs/tags/v${_mng_ver}.tar.gz")
sha512sums=('SKIP'
            '11d708d511b63e5541bcc1dbcaf29abbf7cb9583b1d313028770a39b26b41d48dcba023f7e1d6fe30f3c093d20e10a43363011edd432e5785a4580e5c5f852a6')

_game="magma"
_user="${_game//./-}"
_server_root="/srv/magma"

prepare() {
	export _game
	export _user
	export _server_root
	envsubst < "${startdir}/${pkgname}.install.tmpl" > "${startdir}/${pkgname}.install"

	cd "${srcdir}/${pkgname}"
	git submodule init
	git submodule update
}

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD | cut -c1-8)"
}

build() {
	# Detect JAVA home
	export JAVA_HOME="/usr/lib/jvm/$(archlinux-java status | tail -n +2 | cut -d ' ' -f 3 | grep '8-')"

	make -C "${srcdir}/minecraft-server-${_mng_ver}" clean

	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		GAME=${_game} \
		INAME=${_game}d \
		SERVER_ROOT=${_server_root} \
		BACKUP_PATHS="world world_nether world_the_end" \
		GAME_USER=${_user} \
		SESSION_NAME="magma" \
		MAIN_EXECUTABLE="magma-server.jar" \
		SERVER_START_CMD="${JAVA_HOME}/bin/java -Xms512M -Xmx1024M -jar ./magma-server.jar nogui" \
		all

	cd "${srcdir}/${pkgname}"

	export MAVEN_OPTS="-Xmx2G"

	./gradlew outputJar
}

package() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		DESTDIR="${pkgdir}" \
		GAME=${_game} \
		INAME=${_game}d \
		install

	install -Dm644 "${srcdir}/${pkgname}/build/distributions/Magma-${_pkgver}-${pkgver##*.}-server.jar" "${pkgdir}${_server_root}/magma-server-${_pkgver}.jar"
	# Link server jar file
	ln -s "magma-server-${_pkgver}.jar" "${pkgdir}${_server_root}/magma-server.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
