# Maintainer: Nitroretro <nitroretro@protonmail.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Philip Abernethy <chais.z3r0@gmail.com>
# Contributor: sowieso <sowieso@dukun.de>

pkgname=forge-server
_minecraft_ver=1.12.2
pkgver=${_minecraft_ver}_14.23.5.2768
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
sha512sums=('fefaabeccd17b98752cbef8bd01f4bce27e351106c256edf6aba92267e0fc4ded36fba089f9b7f5fc2d210e5f7b07bca38d8254a2f4732516720e45a249dc5c2'
            'e9a391a330320a7aea127a3e8ad399d8d6e3c926eac2c0df7a4e550ba61cc13fec737f7e984bd98b9e1f9f9d5a654ee241eeef6a2e433ec845e300ef29405f62'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            'd6bde61a7aa479b85e35b4a3eccb9b3237a6c97f8919b3d704434f1df15672b74c7ae9ca9473eea6a0593e6e80892a2510782115185c1b7fe332720ccb78a7bd'
            'ad305f48d869d18cb13f4c4fbae2c5cdfb87d0910ae3d8dd8c0fe83ff0533a8f944fd694718faa1b2cdd6e891d9a4ab3fa43434f75bd9ce5b1ae3b54844f714b'
            '56e4dfa327a4ab23d067e0bbde372718401027023771c01248bd2283807007379dfca2bbf0ec070d8047cffdef49f3d19fb5776cf6315f5c1aaff6d605215b6d'
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
	install -Dm644 "${_game}-${_ver}-universal.jar"         "${pkgdir}${_server_root}/${_game}-${_ver}-universal.jar"
	install -Dm644 "minecraft_server.${_minecraft_ver}.jar" "${pkgdir}${_server_root}/minecraft_server.${_minecraft_ver}.jar"
	ln -s "${_game}-${_ver}-universal.jar" "${pkgdir}${_server_root}/${_game}-universal.jar"

	# Install libraries
	find libraries -type f -print0 | xargs -0 -i@ install -Dm644 '@' "${pkgdir}${_server_root}/@"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
