# Maintainer: Nitroretro <nitroretro@protonmail.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Philip Abernethy <chais.z3r0@gmail.com>
# Contributor: sowieso <sowieso@dukun.de>

pkgname=forge-server
_minecraft_ver=1.14.4
pkgver=${_minecraft_ver}_28.1.0
_ver=${pkgver//_/-}
pkgrel=1
pkgdesc="Minecraft Forge server unit files, script, and jar"
arch=('any')
url="https://minecraftforge.net/"
license=('custom')
depends=('java-runtime-headless=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
backup=('etc/conf.d/forge')
install="${pkgname}.install"
source=("forge-${_ver}-installer.jar"::"https://files.minecraftforge.net/maven/net/minecraftforge/forge/${_ver}/forge-${_ver}-installer.jar"
	"forged-backup.service"
	"forged-backup.timer"
	"forged.service"
	"forged.conf"
	"forged.sh"
	"LICENSE.txt")
noextract=("forge-${_ver}-installer.jar")
sha512sums=('2890b40882c6b91a96024ba7ace6feef85530be74bfde4441fd55ca5244b5a739ccfd8d2d99b47e6fb97b1acc3ee5aa5a648d637f8afa2f353abdb1986d4dcb9'
            'e9a391a330320a7aea127a3e8ad399d8d6e3c926eac2c0df7a4e550ba61cc13fec737f7e984bd98b9e1f9f9d5a654ee241eeef6a2e433ec845e300ef29405f62'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            'd6bde61a7aa479b85e35b4a3eccb9b3237a6c97f8919b3d704434f1df15672b74c7ae9ca9473eea6a0593e6e80892a2510782115185c1b7fe332720ccb78a7bd'
            '81251b608fe1a62867c0b5c431fb88135e8a2200327fa57b07c7c83863eddd3c9840190d98dd4a8312c66e6a24d4593b2fda743553386412362c94c0cf6a75c4'
            'ae4626563595165c8f34de87b6d83f473aef81e1437711e5a11fd9694a59311f3f3d420fb43e5e0a59bd6681298c9544781c667cc6f9abedd9c18035da66d9a4'
            '3da10d63a5edee4bc8bcd3d5c2730771062f7fa58626a8c51635fbe96bfbceca3ff6937cfaad3e17f16a94ef95137f7c78cc6dac1c846a6b9a8f18d3c6355973')

_game="forge"
_server_root="/srv/forge"

build() {
	java -jar "forge-${_ver}-installer.jar" --installServer
}

package() {
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

	install -Dm644 "${_game}d.conf"                         "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 "${_game}d.sh"                           "${pkgdir}/usr/bin/${_game}d"
	install -Dm644 "${_game}d.service"                      "${pkgdir}/usr/lib/systemd/system/${_game}d.service"
	install -Dm644 "${_game}d-backup.service"               "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.service"
	install -Dm644 "${_game}d-backup.timer"                 "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.timer"
	install -Dm644 "${_game}-${_ver}.jar"                   "${pkgdir}${_server_root}/${_game}-${_ver}.jar"
	install -Dm644 "minecraft_server.${_minecraft_ver}.jar" "${pkgdir}${_server_root}/minecraft_server.${_minecraft_ver}.jar"
	ln -s "${_game}-${_ver}.jar" "${pkgdir}${_server_root}/${_game}.jar"

	# Install libraries
	find libraries -type f -print0 | xargs -0 -i@ install -Dm644 '@' "${pkgdir}${_server_root}/@"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
