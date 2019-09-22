# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_game="forge-1.8.9"
_server_root="/srv/forge-1.8.9"

_minecraft_ver=1.8.9
_pkgver=${_minecraft_ver}-11.15.1.1722

pkgname=forge-server-1.8.9
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Minecraft Forge server unit files, script, and jar"
arch=('any')
url="https://minecraftforge.net/"
license=('custom')
depends=('java-runtime-headless=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups" "netcat: required in order to suspend an idle server")
backup=("etc/conf.d/${_game}")
install="${pkgname}.install"
source=("${_game}-${_pkgver}-installer.jar"::"https://files.minecraftforge.net/maven/net/minecraftforge/forge/${_pkgver}/forge-${_pkgver}-installer.jar"
	"${_game}d-backup.service"
	"${_game}d-backup.timer"
	"${_game}d.service"
	"${_game}d.conf"
	"${_game}d.sh"
	"LICENSE-fml.txt"
	"MinecraftForge-License.txt"
	"Paulscode IBXM Library License.txt"
	"Paulscode SoundSystem CodecIBXM License.txt")
noextract=("${_game}-${_pkgver}-installer.jar")
sha512sums=('f592a98268450381f108e8bbc92c6abf7197ad4a8f4ae0863acb089d6b098c411b73ae6f2d9376333735b008c80505b4f5b20ba2c733380e509b2d90bbb38632'
            'b51a6d7581faa98ac543e8d1f9655c93defb575846fe245ddf9a77250721889cac9efc4744989be50f801c009662212135e8cddd594f106e1c218e651975e51b'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            '96b776b1eead0291c01f0c9396425183dbe52877763647bd014f74655660877d19403bc9873223a481a48c60e97e37451cf0461fd471f26d08cb26fffabb320b'
            'e2205bbe69d716f360229940bf2ef432dcc550cf5c5e54120a4556cba024310c32199481621bac68c52097bd83244172e016cec14057f1b84c5d397dac6500d3'
            'c54bc1bda683de235aa14da23c1216071be69a08e87ca0dbe29b982de64a68df09f020f307885d981c52e8f03e9aa61ee78d53718df5719da7518f5652fba871'
            '07860198b7d40726e9597f9ac748904a8e27bdcf87151f0b1c8c2ade024ad16aa83d412b70f900a7de3f58773f325ee45eb6c30cb1395e45a4d8092a19b4f845'
            'dedd8e121e79bdd39c824a2d4acbc231ae6339cfd29894c4e7299359d23bc92423f4a865865372745be996b0bc14f5777e06baae8b1f4e5c302eadeac5aecf15'
            '7f158bed6957e5285ce45a480f6a222065af5427bd48481ef24eb770ff540aa67b2d1c1ed976d216db94323017f7c7ee1dfe16e3f222b14189f9823e0b49f0f3'
            '2c9bdefe7d022be139e7aec2e5f1cc1f83ea9d35d2c945e26422e140027b5107ce32c56f0b97e7dbf6b6edb282075df4a18c156a6ed6b064bcb10a3b4481a9aa')

prepare() {
	java -jar "${_game}-${_pkgver}-installer.jar" --installServer
}

package() {
	install -Dm644 "LICENSE-fml.txt"                             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-fml.txt"
	install -Dm644 "MinecraftForge-License.txt"                  "${pkgdir}/usr/share/licenses/${pkgname}/MinecraftForge-License.txt"
	install -Dm644 "Paulscode IBXM Library License.txt"          "${pkgdir}/usr/share/licenses/${pkgname}/Paulscode IBXM Library License.txt"
	install -Dm644 "Paulscode SoundSystem CodecIBXM License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Paulscode SoundSystem CodecIBXM License.txt"

	install -Dm644 "${_game}d.conf"                         "${pkgdir}/etc/conf.d/${_game}"
	install -Dm755 "${_game}d.sh"                           "${pkgdir}/usr/bin/${_game}d"
	install -Dm644 "${_game}d.service"                      "${pkgdir}/usr/lib/systemd/system/${_game}d.service"
	install -Dm644 "${_game}d-backup.service"               "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.service"
	install -Dm644 "${_game}d-backup.timer"                 "${pkgdir}/usr/lib/systemd/system/${_game}d-backup.timer"
	install -Dm644 "forge-${_pkgver}-universal.jar"         "${pkgdir}${_server_root}/${_game}-${_pkgver}.jar"
	install -Dm644 "minecraft_server.${_minecraft_ver}.jar" "${pkgdir}${_server_root}/minecraft_server.${_minecraft_ver}.jar"
	ln -s "${_game}-${_pkgver}.jar" "${pkgdir}${_server_root}/${_game}.jar"

	# Install libraries
	find libraries -type f -print0 | xargs -0 -i@ install -Dm644 '@' "${pkgdir}${_server_root}/@"

	# Link the log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/${_server_root}/logs"
	ln -s "${_server_root}/logs" "${pkgdir}/var/log/${_game}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${pkgdir}${_server_root}"
}
