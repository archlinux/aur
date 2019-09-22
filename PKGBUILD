# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_game="forge-1.11.2"
_server_root="/srv/forge-1.11.2"
_minecraft_ver=1.11.2
_pkgver=${_minecraft_ver}-13.20.1.2386

pkgname=forge-server-1.11.2
pkgver=${_pkgver//-/_}
pkgrel=3
pkgdesc="Minecraft Forge server unit files, script, and jar"
arch=('any')
url="https://minecraftforge.net/"
license=('custom')
depends=('java-runtime-headless=8' 'screen' 'sudo' 'bash' 'awk' 'sed')
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
backup=("etc/conf.d/${_game}")
install="${pkgname}.install"
source=("${_game}-${_pkgver}-installer.jar"::"https://files.minecraftforge.net/maven/net/minecraftforge/forge/${_pkgver}/forge-${_pkgver}-installer.jar"
	"${_game}d-backup.service"
	"${_game}d-backup.timer"
	"${_game}d.service"
	"${_game}d.conf"
	"${_game}d.sh"
	"LICENSE-fml.txt"
	"LICENSE-new.txt"
	"MinecraftForge-License.txt")
noextract=("${_game}-${_pkgver}-installer.jar")
sha512sums=('4eef89201fb6f8662912a5ceb3cfaa0c68da6ca874e403b02f40afa7132f48c339815b987dc190903e4053531957c009f46d388b88083f54f349a3dd6ad26b42'
            '70d7f3855ada6bd06ed707d99d2bc782c8da2f79d236e4d3e0d95ab12e675c8a39d85cd21df8313cd32b00a0227f020c31ab8f77a572d9cf590cbf75655ee426'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            'e3810d59408b303601c9fae95cafaa140019b214b452d36b0ce6017f5724f3c35d8b7f8c06c2c20118ddffeb7faa70ddea09de62e60ab12ddbc2d9e875a68421'
            'c765776ade02eab1a5b2a56b7848f36b7a2e4523e3e753c9a18223bef7307240d867782aa0a4aca9697efd9615fa48cdb8cafdf86d4e344560128abde30c310f'
            'd92dc4745fd335d4c755c9a672741e3c10582a60cf0c81fa74e2f8ae0377c7310c8787cd11dc15d3667703829f12cd3dd9fd288fc8d047d1037ca2333719f05e'
            '07860198b7d40726e9597f9ac748904a8e27bdcf87151f0b1c8c2ade024ad16aa83d412b70f900a7de3f58773f325ee45eb6c30cb1395e45a4d8092a19b4f845'
            '7fe8163f3f1bb86e59508aff851eb571e280da36c24a6faf49ae51d6a000282bac8c388ac1c0c1208220b3f8fb62466285a306213f5a014faa1b619f4c48bf9b'
            'dedd8e121e79bdd39c824a2d4acbc231ae6339cfd29894c4e7299359d23bc92423f4a865865372745be996b0bc14f5777e06baae8b1f4e5c302eadeac5aecf15')

prepare() {
	java -jar "${_game}-${_pkgver}-installer.jar" --installServer
}

package() {
	install -Dm644 "LICENSE-fml.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-fml.txt"
	install -Dm644 "LICENSE-new.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-new.txt"
	install -Dm644 "MinecraftForge-License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/MinecraftForge-License.txt"

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
