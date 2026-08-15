# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=papermc
_papermc_api="https://fill.papermc.io/v3"
_papermc_user_agent="papermc-arch/1.0 (https://aur.archlinux.org/packages/papermc)"
# curl -sH "User-Agent: ${_papermc_user_agent}" "${_papermc_api}/projects/paper"
_pkgver=26.2
# curl -sH "User-Agent: ${_papermc_user_agent}" "${_papermc_api}/projects/paper/versions/${_pkgver}/builds"
_build=112
_license_commit=caf76f1
pkgver="${_pkgver}+b${_build}"
pkgrel=1
_mng_ver=1.0.4
pkgdesc="Next generation of Minecraft server, compatible with Spigot plugins and offering uncompromising performance"
arch=('any')
url="https://papermc.io/"
license=('custom')
depends=('java-runtime-headless>=16' 'tmux' 'sudo' 'bash' 'awk' 'sed')
makedepends=('curl' 'jq')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
conflicts=('papermc-git')
backup=('etc/conf.d/papermc')
install="${pkgname}.install"
_papermc_url="$(curl -fsSL -H "User-Agent: ${_papermc_user_agent}" "${_papermc_api}/projects/paper/versions/${_pkgver}/builds" | jq -r ".[] | select(.id == ${_build}) | .downloads[\"server:default\"].url")"
source=("papermc.${pkgver}.jar"::"${_papermc_url}"
	"LICENSE_${pkgver}.md"::"https://raw.githubusercontent.com/PaperMC/Paper/${_license_commit}/LICENSE.md"
	"minecraft-server-${_mng_ver}.tar.gz"::"https://github.com/Edenhofer/minecraft-server/archive/refs/tags/v${_mng_ver}.tar.gz")
noextract=("papermc.${pkgver}.jar")
sha512sums=('f2282fc3b59850ed9cfd62be62d45458e07c7680a78bf5b271dbd6aa6029f7e16f5821ae618bf8e397e59fd775a05def230cfdac253f7acd1d7648ba139713e1'
            '882be11c8e603c3b7afa1004c4e0d89673e509794d9b8766c91e8bbb53e36ed595d0761505455504d9fd4fa7c55b566bed39539e513b59e03ff8a4d1d6ed3cca'
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
