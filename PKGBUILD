# Maintainer: jSQrD <n1irdwd5 at aur dot addy dot io>

# Previous 'fabric-server' maintainers
## Contributor: lgm <lgm dot aur at outlook dot com>
## Contributor: Ndoskrnl <lollipop.studio.cn@gmail.com>
## Contributor: flying <flyinghat42@gmail.com>

# Based on the 'forge-server' AUR package by:
## Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_minecraft_ver="1.21.11"
_fabric_ver="1.1.0"
_fabric_loader_ver="0.18.2"
_mng_ver=1.0.4

pkgname="fabric-server"
_fabric_name="fabric"
pkgver=${_minecraft_ver}_${_fabric_loader_ver}_${_fabric_ver}
pkgrel=1
pkgdesc="A Fabric (a modular, lightweight mod loader) enabled Minecraft server"
arch=("any")
url="https://fabricmc.net"
license=("Apache-2.0")
depends=("java-runtime-headless>=21" "tmux" "sudo" "bash" "awk" "sed")
optdepends=("tar: required in order to create world backups"
	"netcat: required in order to suspend an idle server")
provides=("fabric-server=${pkgver}")
backup=("etc/conf.d/${_fabric_name}")
install="fabric-server.install"

source=(
	"minecraft-server-${_mng_ver}.tar.gz::https://github.com/Edenhofer/minecraft-server/archive/refs/tags/v${_mng_ver}.tar.gz"
	"fabric-installer-${_fabric_ver}.jar::https://maven.fabricmc.net/net/fabricmc/fabric-installer/${_fabric_ver}/fabric-installer-${_fabric_ver}.jar"
)
noextract=("fabric-${pkgver}.jar")
sha512sums=(
	'dd4d68ca061c97a1e3cb5c0bb68439f7d8d45b15092344f3c4dbd4f7f39fef433d566670ad440970061007d93055183b570c7bf98f09c111ecdf8ab0f208f556'
	'7e593bf7b2786851aed680186e50dbbf8af7e7e592bc69c28c199d739307ea4b80b3575954a817ed97171d1516ea8afdd6ede4767d51ec414dbd3a1032111516'
)

_game="fabric"
_server_root="/srv/${_fabric_name}"

prepare() {
	java -Duser.home="${srcdir}" -jar "fabric-installer-${_fabric_ver}.jar" server -mcversion "${_minecraft_ver}" -downloadMinecraft -loader "${_fabric_loader_ver}"
}

build() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" clean

	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		GAME=${_game} \
		INAME=${_game}d \
		SERVER_ROOT="${_server_root}" \
		BACKUP_PATHS="world banned-ips.json banned-players.json config ops.json server.properties usercache.json user_jvm_args.txt whitelist.json" \
		GAME_USER=${_game} \
		MAIN_EXECUTABLE=fabric-server-launch.jar \
		SERVER_START_CMD="java -Dlog4j2.formatMsgNoLookups=true -Xms512M -Xmx1024M -jar './\$\${MAIN_EXECUTABLE}' nogui" \
		all
}

package() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		DESTDIR="${pkgdir}" \
		GAME=${_game} \
		INAME=${_game}d \
		install

	# Install Fabric & Minecraft server jars
	install -Dm644 "fabric-server-launch.jar" "${pkgdir}${_server_root}/fabric-server-launch.jar"
	install -Dm644 "server.jar" "${pkgdir}${_server_root}/server.jar"

	# Install libraries
  install -dm755 "libraries" "${pkgdir}${_server_root}/libraries"
	cp -r libraries/* "${pkgdir}${_server_root}/libraries/"
  find "${pkgdir}${_server_root}/libraries" -type d -exec chmod 755 {} +
  find "${pkgdir}${_server_root}/libraries" -type f -exec chmod 644 {} +

	# Link log files
	install -dm755 "${pkgdir}/var/log"
  install -dm2755 "${pkgdir}${_server_root}/logs"
  ln -s "/srv/${_fabric_name}/logs" "${pkgdir}/var/log/${_fabric_name}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
