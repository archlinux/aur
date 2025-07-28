# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=papermc
# curl -X GET "https://api.papermc.io/v2/projects/paper" -H  "accept: application/json"
_pkgver=1.21.8
# curl -X GET "https://api.papermc.io/v2/projects/paper/versions/${_pkgver}" -H  "accept: application/json"
_build=11
_license_commit=c6233d8
pkgver="${_pkgver}+b${_build}"
pkgrel=1
_mng_ver=1.0.4
pkgdesc="Next generation of Minecraft server, compatible with Spigot plugins and offering uncompromising performance"
arch=('any')
url="https://papermc.io/"
license=('custom')
depends=('java-runtime-headless>=16' 'tmux' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
conflicts=('papermc-git')
backup=('etc/conf.d/papermc')
install="${pkgname}.install"
source=("papermc.${pkgver}.jar"::"https://api.papermc.io/v2/projects/paper/versions/${_pkgver}/builds/${_build}/downloads/paper-${_pkgver}-${_build}.jar"
	"LICENSE_${pkgver}.md"::"https://raw.githubusercontent.com/PaperMC/Paper/${_license_commit}/LICENSE.md"
	"minecraft-server-${_mng_ver}.tar.gz"::"https://github.com/Edenhofer/minecraft-server/archive/refs/tags/v${_mng_ver}.tar.gz")
noextract=("papermc.${pkgver}.jar")
sha512sums=('ffca0fe7480ebcc55a36cbce8936a5de4a0260d86a20bd7e0fa24215218fca5de3ec842b74aa0c93bbe806716075467f4bae1fc1f1ffcc68c941b6963008345b'
            'adcd47499c3803557031a3621b4787243447f3a548320c07314a91d7e28b4dc128952d9052d7d16b5e24b8629b08e1aca8b2e84c370a9922ec12732ff8487af7'
            'dd4d68ca061c97a1e3cb5c0bb68439f7d8d45b15092344f3c4dbd4f7f39fef433d566670ad440970061007d93055183b570c7bf98f09c111ecdf8ab0f208f556')

_game="papermc"
_server_root="/srv/papermc"

build() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" clean

	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		GAME=${_game} \
		INAME=${_game} \
		SERVER_ROOT=${_server_root} \
		BACKUP_PATHS="world" \
		GAME_USER=${_game} \
		MAIN_EXECUTABLE=papermc_server.jar \
		SERVER_START_CMD="java -Xms512M -Xmx1024M -jar ./papermc_server.jar nogui" \
		all
}

package() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		DESTDIR="${pkgdir}" \
		GAME=${_game} \
		INAME=${_game} \
		install

	install -Dm644 ${_game}.${pkgver}.jar     "${pkgdir}/${_server_root}/${_game}.${pkgver}.jar"
	ln -s "${_game}.${pkgver}.jar" "${pkgdir}${_server_root}/${_game}_server.jar"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+s "${pkgdir}${_server_root}"

	install -D ./LICENSE_${pkgver}.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
